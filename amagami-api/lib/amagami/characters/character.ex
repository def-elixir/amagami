defmodule Amagami.Characters.Character do
  use Ecto.Schema
  import Ecto.Changeset

  schema "characters" do
    field :name, :string
    field :cv, :string
    field :class, :string
    field :club, :string
    field :blood_type, :string
    field :age, :integer
    field :birthday, :string
    field :sign, :string
    field :like, :string
    field :dislike, :string
    field :description, :string
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(character, attrs) do
    character
    |> cast(attrs, [:name, :cv, :class, :club, :blood_type, :age, :birthday, :sign, :like, :dislike, :description])
    |> validate_required([:name, :cv, :class, :blood_type, :age, :birthday, :sign, :like, :dislike, :description])
  end
end
