defmodule PokeApi.Repo.Migrations.AddPokemonAbilities do
  use Ecto.Migration

  def change do
    create table("pokemon_abilities") do
      add(:pokemon_id, references(:pokemon), null: false)
      add(:ability_id, references(:abilities), null: false)
    end
  end
end
