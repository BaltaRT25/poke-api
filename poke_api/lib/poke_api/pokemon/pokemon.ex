defmodule PokeApi.Pokemon.Pokemon do
  use Ecto.Schema
  import Ecto.Changeset
  alias PokeApi.Pokemon.Type
  alias PokeApi.Pokemon.Ability
  alias PokeApi.Pokemon.PokemonAbilities

  schema "pokemon" do
    field(:dex_number, :integer)
    field(:name, :string)
    belongs_to(:type1, Type)
    belongs_to(:type2, Type)
    many_to_many(:abilities, Ability, join_through: PokemonAbilities)
  end

  def changeset(pokemon, params \\ %{}) do
    pokemon
    |> cast(params, [:dex_number, :name, :type1_id, :type2_id])
    |> validate_required([:dex_number, :name, :type1_id])
    |> unique_constraint(:dex_number)
  end
end
