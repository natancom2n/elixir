defmodule Listacmp.Listacomp do
  @moduledoc """
  The Listacomp context.
  """

  import Ecto.Query, warn: false
  alias Listacmp.Repo

  alias Listacmp.Listacomp.Prod

  @doc """
  Returns the list of lista.

  ## Examples

      iex> list_lista()
      [%Prod{}, ...]

  """
  def list_lista do
    Repo.all(Prod)
  end

  @doc """
  Gets a single prod.

  Raises `Ecto.NoResultsError` if the Prod does not exist.

  ## Examples

      iex> get_prod!(123)
      %Prod{}

      iex> get_prod!(456)
      ** (Ecto.NoResultsError)

  """
  def get_prod!(id), do: Repo.get!(Prod, id)

  @doc """
  Creates a prod.

  ## Examples

      iex> create_prod(%{field: value})
      {:ok, %Prod{}}

      iex> create_prod(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_prod(attrs \\ %{}) do
    %Prod{}
    |> Prod.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a prod.

  ## Examples

      iex> update_prod(prod, %{field: new_value})
      {:ok, %Prod{}}

      iex> update_prod(prod, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_prod(%Prod{} = prod, attrs) do
    prod
    |> Prod.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a prod.

  ## Examples

      iex> delete_prod(prod)
      {:ok, %Prod{}}

      iex> delete_prod(prod)
      {:error, %Ecto.Changeset{}}

  """
  def delete_prod(%Prod{} = prod) do
    Repo.delete(prod)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking prod changes.

  ## Examples

      iex> change_prod(prod)
      %Ecto.Changeset{data: %Prod{}}

  """
  def change_prod(%Prod{} = prod, attrs \\ %{}) do
    Prod.changeset(prod, attrs)
  end
end
