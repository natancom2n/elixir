defmodule ListacmpWeb.ProdControllerTest do
  use ListacmpWeb.ConnCase

  import Listacmp.ListacompFixtures

  @create_attrs %{price: 120.5, produto: "some produto"}
  @update_attrs %{price: 456.7, produto: "some updated produto"}
  @invalid_attrs %{price: nil, produto: nil}

  describe "index" do
    test "lists all lista", %{conn: conn} do
      conn = get(conn, Routes.prod_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Lista"
    end
  end

  describe "new prod" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.prod_path(conn, :new))
      assert html_response(conn, 200) =~ "New Prod"
    end
  end

  describe "create prod" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.prod_path(conn, :create), prod: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.prod_path(conn, :show, id)

      conn = get(conn, Routes.prod_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Prod"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.prod_path(conn, :create), prod: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Prod"
    end
  end

  describe "edit prod" do
    setup [:create_prod]

    test "renders form for editing chosen prod", %{conn: conn, prod: prod} do
      conn = get(conn, Routes.prod_path(conn, :edit, prod))
      assert html_response(conn, 200) =~ "Edit Prod"
    end
  end

  describe "update prod" do
    setup [:create_prod]

    test "redirects when data is valid", %{conn: conn, prod: prod} do
      conn = put(conn, Routes.prod_path(conn, :update, prod), prod: @update_attrs)
      assert redirected_to(conn) == Routes.prod_path(conn, :show, prod)

      conn = get(conn, Routes.prod_path(conn, :show, prod))
      assert html_response(conn, 200) =~ "some updated produto"
    end

    test "renders errors when data is invalid", %{conn: conn, prod: prod} do
      conn = put(conn, Routes.prod_path(conn, :update, prod), prod: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Prod"
    end
  end

  describe "delete prod" do
    setup [:create_prod]

    test "deletes chosen prod", %{conn: conn, prod: prod} do
      conn = delete(conn, Routes.prod_path(conn, :delete, prod))
      assert redirected_to(conn) == Routes.prod_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.prod_path(conn, :show, prod))
      end
    end
  end

  defp create_prod(_) do
    prod = prod_fixture()
    %{prod: prod}
  end
end
