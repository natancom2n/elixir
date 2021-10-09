defmodule Listacmp.Repo.Migrations.CreateLista do
  use Ecto.Migration

  def change do
    create table(:lista) do
      add :produto, :string
      add :price, :float

      timestamps()
    end
  end
end
