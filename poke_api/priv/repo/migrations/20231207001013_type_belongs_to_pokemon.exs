defmodule PokeApi.Repo.Migrations.TypeBelongsToPokemon do
  use Ecto.Migration

  def change do
    alter table(:pokemon) do
      add(:type1_id, references(:types))
      add(:type2_id, references(:types), null: true)
    end
  end
end
