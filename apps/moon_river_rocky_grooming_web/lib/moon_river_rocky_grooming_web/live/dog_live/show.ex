defmodule MoonRiverRockyGroomingWeb.DogLive.Show do
  use MoonRiverRockyGroomingWeb, :live_view

  alias MoonRiverRockyGrooming.Dogs

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:dog, Dogs.get_dog!(id))}
  end

  defp page_title(:show), do: "Show Dog"
  defp page_title(:edit), do: "Edit Dog"
end
