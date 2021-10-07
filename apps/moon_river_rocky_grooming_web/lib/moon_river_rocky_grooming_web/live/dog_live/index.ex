defmodule MoonRiverRockyGroomingWeb.DogLive.Index do
  use MoonRiverRockyGroomingWeb, :live_view

  require Integer

  alias MoonRiverRockyGrooming.Dogs
  alias MoonRiverRockyGrooming.Dogs.Dog

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :dogs, list_dogs())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Dog")
    |> assign(:dog, Dogs.get_dog!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Dog")
    |> assign(:dog, %Dog{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Dogs")
    |> assign(:dog, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    dog = Dogs.get_dog!(id)
    {:ok, _} = Dogs.delete_dog(dog)

    {:noreply, assign(socket, :dogs, list_dogs())}
  end

  defp list_dogs do
    Dogs.list_dogs()
  end
end
