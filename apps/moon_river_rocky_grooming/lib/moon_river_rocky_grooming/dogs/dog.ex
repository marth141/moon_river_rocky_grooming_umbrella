defmodule MoonRiverRockyGrooming.Dogs.Dog do
  use Ecto.Schema
  import Ecto.Changeset

  @fields [
    :age,
    :birthday,
    :breed,
    :name,
    :vaccinated,
    :weight
  ]

  schema "dogs" do
    field :age, :integer
    field :birthday, :utc_datetime
    field :breed, :string
    field :name, :string
    field :vaccinated, :boolean
    field :weight, :integer

    timestamps()
  end

  @doc false
  def changeset(dog, attrs) do
    dog
    |> cast(attrs, @fields)
    |> validate_required(@fields)
  end
end
