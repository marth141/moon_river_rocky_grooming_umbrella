defmodule MoonRiverRockyGrooming.Repo.Migrations.CreateDogs do
  use Ecto.Migration

  def change do
    create table(:dogs) do
      add :age, :integer
      add :birthday, :utc_datetime
      add :breed, :string
      add :name, :string
      add :vaccinated, :boolean
      add :weight, :integer

      timestamps()
    end
  end
end
