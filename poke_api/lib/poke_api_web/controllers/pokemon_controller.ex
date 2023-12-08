defmodule PokeApiWeb.PokemonController do
  use PokeApiWeb, :controller

  alias PokeApi.Pokemon
  alias PokeApi.Pokemon.Pokemon, as: PPokemon

  def get_pokemon(conn, %{"id_or_name" => id_or_name}) do
    case Pokemon.get_pokemon_by_id_or_name(id_or_name) do
      %PPokemon{} = pokemon ->
        conn
        |> put_status(200)
        |> render("detail.json", %{pokemon: pokemon})

      nil ->
        conn
        |> put_status(404)
        |> json(%{error: "Not found"})
    end
  end

  def create_pokemon(conn, pokemon_params) do
    IO.inspect(pokemon_params)

    case Pokemon.create_pokemon(pokemon_params) do
      {:ok, %PPokemon{} = pokemon} ->
        conn
        |> put_status(200)
        |> IO.inspect(label: "VALUE")
        |> render("detail.json", %{pokemon: pokemon})

      {:error, error} ->
        IO.inspect(error, label: "ERROR!")

        conn
        |> put_status(400)
        |> json(%{})
    end
  end

  def create_pokemon_with_type(conn, params) do
    Pokemon.create_pokemon_with_type(params)

    conn
    |> put_status(200)
    |> json(%{})
  end

  def get_all(conn, _params) do
    pokemon_list = Pokemon.get_all()

    conn
    |> put_status(200)
    |> render("index.json", %{list_pokemon: pokemon_list})
  end
end
