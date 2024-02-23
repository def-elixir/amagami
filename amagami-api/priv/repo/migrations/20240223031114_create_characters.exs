defmodule Amagami.Repo.Migrations.CreateCharacters do
  use Ecto.Migration

  def change do
    create table(:characters) do
      add :name, :string, null: false
      add :cv, :string, null: false
      add :class, :string, null: false
      add :club, :string, null: true
      add :blood_type, :string, null: false
      add :age, :integer, null: false
      add :birthday, :string, null: false
      add :sign, :string, null: false
      add :like, :string, null: false
      add :dislike, :string, null: false
      add :description, :text, null: false
      timestamps(type: :utc_datetime)
    end
  end
end
