# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     PokeApi.Repo.insert!(%PokeApi.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias PokeApi.Repo

alias PokeApi.Pokemon.{
  Pokemon,
  Type
}

type1 = %Type{name: "Grass"}
type2 = %Type{name: "Poison"}

type1 = Repo.insert!(type1)
type2 = Repo.insert!(type2)

poke1 = %Pokemon{dex_number: 1, name: "Bulbasaur", type1_id: type1.id, type2_id: type2.id}
poke2 = %Pokemon{dex_number: 2, name: "Ivysaur", type1_id: type1.id, type2_id: type2.id}

Repo.insert!(poke1)
Repo.insert!(poke2)
