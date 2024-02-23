defmodule Amagami.CharactersTest do
  use Amagami.DataCase

  alias Amagami.Characters

  describe "characters" do
    alias Amagami.Characters.Character

    import Amagami.CharactersFixtures

    @invalid_attrs %{link: nil, title: nil}

    test "list_characters/0 returns all characters" do
      character = character_fixture()
      assert Characters.list_characters() == [character]
    end

    test "get_character!/1 returns the character with given id" do
      character = character_fixture()
      assert Characters.get_character!(character.id) == character
    end

    test "create_character/1 with valid data creates a character" do
      valid_attrs = %{link: "some link", title: "some title"}

      assert {:ok, %Character{} = character} = Characters.create_character(valid_attrs)
      assert character.link == "some link"
      assert character.title == "some title"
    end

    test "create_character/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Characters.create_character(@invalid_attrs)
    end

    test "update_character/2 with valid data updates the character" do
      character = character_fixture()
      update_attrs = %{link: "some updated link", title: "some updated title"}

      assert {:ok, %Character{} = character} = Characters.update_character(character, update_attrs)
      assert character.link == "some updated link"
      assert character.title == "some updated title"
    end

    test "update_character/2 with invalid data returns error changeset" do
      character = character_fixture()
      assert {:error, %Ecto.Changeset{}} = Characters.update_character(character, @invalid_attrs)
      assert character == Characters.get_character!(character.id)
    end

    test "delete_character/1 deletes the character" do
      character = character_fixture()
      assert {:ok, %Character{}} = Characters.delete_character(character)
      assert_raise Ecto.NoResultsError, fn -> Characters.get_character!(character.id) end
    end

    test "change_character/1 returns a character changeset" do
      character = character_fixture()
      assert %Ecto.Changeset{} = Characters.change_character(character)
    end
  end
end
