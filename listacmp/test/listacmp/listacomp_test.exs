defmodule Listacmp.ListacompTest do
  use Listacmp.DataCase

  alias Listacmp.Listacomp

  describe "lista" do
    alias Listacmp.Listacomp.Prod

    import Listacmp.ListacompFixtures

    @invalid_attrs %{price: nil, produto: nil}

    test "list_lista/0 returns all lista" do
      prod = prod_fixture()
      assert Listacomp.list_lista() == [prod]
    end

    test "get_prod!/1 returns the prod with given id" do
      prod = prod_fixture()
      assert Listacomp.get_prod!(prod.id) == prod
    end

    test "create_prod/1 with valid data creates a prod" do
      valid_attrs = %{price: 120.5, produto: "some produto"}

      assert {:ok, %Prod{} = prod} = Listacomp.create_prod(valid_attrs)
      assert prod.price == 120.5
      assert prod.produto == "some produto"
    end

    test "create_prod/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Listacomp.create_prod(@invalid_attrs)
    end

    test "update_prod/2 with valid data updates the prod" do
      prod = prod_fixture()
      update_attrs = %{price: 456.7, produto: "some updated produto"}

      assert {:ok, %Prod{} = prod} = Listacomp.update_prod(prod, update_attrs)
      assert prod.price == 456.7
      assert prod.produto == "some updated produto"
    end

    test "update_prod/2 with invalid data returns error changeset" do
      prod = prod_fixture()
      assert {:error, %Ecto.Changeset{}} = Listacomp.update_prod(prod, @invalid_attrs)
      assert prod == Listacomp.get_prod!(prod.id)
    end

    test "delete_prod/1 deletes the prod" do
      prod = prod_fixture()
      assert {:ok, %Prod{}} = Listacomp.delete_prod(prod)
      assert_raise Ecto.NoResultsError, fn -> Listacomp.get_prod!(prod.id) end
    end

    test "change_prod/1 returns a prod changeset" do
      prod = prod_fixture()
      assert %Ecto.Changeset{} = Listacomp.change_prod(prod)
    end
  end
end
