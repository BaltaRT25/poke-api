defmodule PokeApi.Pokemon.PokemonAbilities do
  alias PokeApi.Pokemon.Pokemon
  alias PokeApi.Pokemon.Ability
  use Ecto.Schema

  schema "pokemon_abilities" do
    belongs_to(:pokemon, Pokemon)
    belongs_to(:abilities, Ability)
  end
end
