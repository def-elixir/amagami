defmodule AmagamiWeb.CharacterJSON do
  alias Amagami.Characters.Character

  @doc """
  Renders a list of characters.
  """
  def index(%{characters: characters}) do
    for(character <- characters, do: data(character))
  end

  @doc """
  Renders a single character.
  """
  def show(%{character: character}) do
    %{data: data(character)}
  end

  defp data(%Character{} = character) do
    %{
      id: character.id,
      name: character.name,
      cv: character.cv,
      class: character.class,
      club: character.club,
      blood_type: character.blood_type,
      age: character.age,
      birthday: character.birthday,
      sign: character.sign,
      like: character.like,
      dislike: character.dislike,
      description: character.description,
    }
  end
end
