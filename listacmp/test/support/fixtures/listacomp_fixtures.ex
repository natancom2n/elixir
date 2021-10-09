defmodule Listacmp.ListacompFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Listacmp.Listacomp` context.
  """

  @doc """
  Generate a prod.
  """
  def prod_fixture(attrs \\ %{}) do
    {:ok, prod} =
      attrs
      |> Enum.into(%{
        price: 120.5,
        produto: "some produto"
      })
      |> Listacmp.Listacomp.create_prod()

    prod
  end
end
