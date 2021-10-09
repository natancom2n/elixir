defmodule Listacmp.Listacomp.Prod do
  use Ecto.Schema
  import Ecto.Changeset

  schema "lista" do
    field :price, :float
    field :produto, :string

    timestamps()
  end

  @doc false
  def changeset(prod, attrs) do
    prod
    |> cast(attrs, [:produto, :price])
    |> validate_required([:produto, :price])
  end
end
