defmodule AmagamiWeb.CharacterController do
  use AmagamiWeb, :controller

  alias Amagami.Characters
  alias Amagami.Characters.Character

  action_fallback AmagamiWeb.FallbackController

  defp search_params(params) do

    default = %{
      id: nil,
      name: nil,
      class: nil,
      blood_type: nil,
      age: nil,
      birthday: nil,
      description: nil
    }

    types = %{
      id: :integer,
      name: :string,
      class: :string,
      blood_type: :string,
      age: :integer,
      birthday: :string,
      description: :string
    }

    changeset =
      {default, types}
      |> Ecto.Changeset.cast(params, Map.keys(types))

    if changeset.valid? do
        {:ok, Ecto.Changeset.apply_changes(changeset)}
    else
        {:error, changeset}
    end
  end

  def index(conn, params) do
    with {:ok, search_params} <- search_params(params) do
      characters = Characters.search_characters(search_params)
      render(conn, :index, characters: characters)
    end
  end

  def create(conn, %{"character" => character_params}) do
    with {:ok, %Character{} = character} <- Characters.create_character(character_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/characters/#{character}")
      |> render(:show, character: character)
    end
  end

  def show(conn, %{"id" => id}) do
    character = Characters.get_character!(id)
    render(conn, :show, character: character)
  end

  def update(conn, %{"id" => id, "character" => character_params}) do
    character = Characters.get_character!(id)

    with {:ok, %Character{} = character} <- Characters.update_character(character, character_params) do
      render(conn, :show, character: character)
    end
  end

  def delete(conn, %{"id" => id}) do
    character = Characters.get_character!(id)

    with {:ok, %Character{}} <- Characters.delete_character(character) do
      send_resp(conn, :no_content, "")
    end
  end
end
