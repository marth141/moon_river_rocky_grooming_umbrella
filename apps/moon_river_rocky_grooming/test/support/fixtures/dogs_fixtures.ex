defmodule MoonRiverRockyGrooming.DogsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MoonRiverRockyGrooming.Dogs` context.
  """

  @doc """
  Generate a dog.
  """
  def dog_fixture(attrs \\ %{}) do
    {:ok, dog} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> MoonRiverRockyGrooming.Dogs.create_dog()

    dog
  end
end
