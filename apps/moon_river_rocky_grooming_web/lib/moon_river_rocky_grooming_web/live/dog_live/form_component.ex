defmodule MoonRiverRockyGroomingWeb.DogLive.FormComponent do
  use MoonRiverRockyGroomingWeb, :live_component

  alias MoonRiverRockyGrooming.Dogs

  @impl true
  def update(%{dog: dog} = assigns, socket) do
    changeset = Dogs.change_dog(dog)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"dog" => dog_params}, socket) do
    changeset =
      socket.assigns.dog
      |> Dogs.change_dog(dog_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"dog" => dog_params}, socket) do
    save_dog(socket, socket.assigns.action, dog_params)
  end

  defp save_dog(socket, :edit, dog_params) do
    case Dogs.update_dog(socket.assigns.dog, dog_params) do
      {:ok, _dog} ->
        {:noreply,
         socket
         |> put_flash(:info, "Dog updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_dog(socket, :new, dog_params) do
    case Dogs.create_dog(dog_params) do
      {:ok, _dog} ->
        {:noreply,
         socket
         |> put_flash(:info, "Dog created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
