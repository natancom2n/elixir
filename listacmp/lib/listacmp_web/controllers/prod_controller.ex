defmodule ListacmpWeb.ProdController do
  use ListacmpWeb, :controller

  alias Listacmp.Listacomp
  alias Listacmp.Listacomp.Prod

  def index(conn, _params) do
    lista = Listacomp.list_lista()
    render(conn, "index.html", lista: lista)
  end

  def new(conn, _params) do
    changeset = Listacomp.change_prod(%Prod{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"prod" => prod_params}) do
    case Listacomp.create_prod(prod_params) do
      {:ok, prod} ->

        conn
        |> put_flash(:info, "Produto criado com sucesso!!")
        |> redirect(to: Routes.prod_path(conn, :show, prod))
        #|> redirect(to:  Routes.prod_path(conn, :index, prod))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    prod = Listacomp.get_prod!(id)
    render(conn, "show.html", prod: prod)
  end

  def edit(conn, %{"id" => id}) do
    prod = Listacomp.get_prod!(id)
    changeset = Listacomp.change_prod(prod)
    render(conn, "edit.html", prod: prod, changeset: changeset)
  end

  def update(conn, %{"id" => id, "prod" => prod_params}) do
    prod = Listacomp.get_prod!(id)

    case Listacomp.update_prod(prod, prod_params) do
      {:ok, prod} ->
        conn
        |> put_flash(:info, "Prod updated successfully.")
        |> redirect(to: Routes.prod_path(conn, :show, prod))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", prod: prod, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    prod = Listacomp.get_prod!(id)
    {:ok, _prod} = Listacomp.delete_prod(prod)

    conn
    |> put_flash(:info, "Produto deletado com sucesso")
    |> redirect(to: Routes.prod_path(conn, :index))
  end
end
