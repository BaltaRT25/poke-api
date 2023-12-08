defmodule PokeApiWeb.PokemonJSON do
  alias PokeApiWeb.AbilitiesJSON

  def detail(%{pokemon: pokemon}) do
    %{
      dex_number: pokemon.dex_number,
      name: pokemon.name,
      type1: pokemon.type1.name,
      type2: pokemon.type2.name,
      abilities: AbilitiesJSON.index(%{abilities: pokemon.abilities})
    }
  end

  def index(%{list_pokemon: list_pokemon}) do
    for pokemon <- list_pokemon do
      detail(%{pokemon: pokemon})
    end
  end
end
