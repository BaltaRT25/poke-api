defmodule PokeApi.Pokemon.Ability do
  use Ecto.Schema
  import Ecto.Changeset
  alias PokeApi.Pokemon.Pokemon
  alias PokeApi.Pokemon.PokemonAbilities

  schema "abilities" do
    field(:name, :string)
    field(:description, :string)
    # many_to_many(:pokemon, Pokemon, join_through: PokemonAbilities)
  end

  def changeset(ability, params \\ %{}) do
    IO.inspect(params)

    ability
    |> cast(params, [:name, :description])
    |> validate_required([:name, :description])
    |> unique_constraint(:name)
  end
end
