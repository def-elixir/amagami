defmodule Amagami.CharactersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Amagami.Characters` context.
  """

  @doc """
  Generate a character.
  """
  def character_fixture(attrs \\ %{}) do
    {:ok, character} =
      attrs
      |> Enum.into(%{
        link: "some link",
        title: "some title"
      })
      |> Amagami.Characters.create_character()

    character
  end
end
