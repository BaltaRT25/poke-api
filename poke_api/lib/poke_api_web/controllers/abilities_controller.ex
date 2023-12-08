defmodule PokeApiWeb.AbilitiesController do
  use PokeApiWeb, :controller
  alias PokeApi.Pokemon
  alias PokeApi.Pokemon.Ability
  alias PokeApiWeb.AbilitiesJSON

  def get_all_abilities(conn, _params) do
    abilities = Pokemon.get_all_abilities()

    conn
    |> put_status(200)
    |> render("index.json", %{abilities: abilities})
  end

  def create_ability(conn, params) do
    case Pokemon.create_ability(params) do
      {:ok, %Ability{} = ability} ->
        # IO.inspect(ability)

        conn
        |> put_status(200)
        |> put_view(AbilitiesJSON)
        |> render("detail.json", %{ability: ability})
    end
  end
end
