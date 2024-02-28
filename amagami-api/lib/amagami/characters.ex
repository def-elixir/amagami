defmodule Amagami.Characters do
  @moduledoc """
  The Characters context.
  """

  import Ecto.Query, warn: false
  alias Amagami.Repo

  alias Amagami.Characters.Character

  @doc """
  Returns the list of characters.

  ## Examples

      iex> list_characters()
      [%Character{}, ...]

  """
  def list_characters do
    Repo.all(Character)
  end

  @doc """
  Gets a single character.

  Raises `Ecto.NoResultsError` if the Character does not exist.

  ## Examples

      iex> get_character!(123)
      %Character{}

      iex> get_character!(456)
      ** (Ecto.NoResultsError)

  """
  def get_character!(id), do: Repo.get!(Character, id)

  @doc """
  Creates a character.

  ## Examples

      iex> create_character(%{field: value})
      {:ok, %Character{}}

      iex> create_character(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_character(attrs \\ %{}) do
    %Character{}
    |> Character.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a character.

  ## Examples

      iex> update_character(character, %{field: new_value})
      {:ok, %Character{}}

      iex> update_character(character, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_character(%Character{} = character, attrs) do
    character
    |> Character.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a character.

  ## Examples

      iex> delete_character(character)
      {:ok, %Character{}}

      iex> delete_character(character)
      {:error, %Ecto.Changeset{}}

  """
  def delete_character(%Character{} = character) do
    Repo.delete(character)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking character changes.

  ## Examples

      iex> change_character(character)
      %Ecto.Changeset{data: %Character{}}

  """
  def change_character(%Character{} = character, attrs \\ %{}) do
    Character.changeset(character, attrs)
  end

  @doc """
  Returns the list of characters.

  ## Examples

      iex> search_characters()
      [%Character{}, ...]

  """
  def search_characters(params \\ %{}) do
    from(c in Character)
    |> filter(:id, params.id)
    |> filter(:name, params.name)
    |> filter(:class, params.class)
    |> filter(:blood_type, params.blood_type)
    |> filter(:age, params.age)
    |> filter(:birthday, params.birthday)
    |> filter(:description, params.description)
    |> Repo.all()
  end

  defp filter(query, _field, nil), do: query

  defp filter(query, field, value) when is_integer(value) do
    query
    |> where([c], field(c, ^field) == ^value)
  end

  defp filter(query, field, value) when is_binary(value) do
    query
    |> where([c], like(field(c, ^field), ^"%#{value}%"))
  end
end
