defmodule PokeApiWeb.TypesController do
  use PokeApiWeb, :controller
  alias PokeApi.Pokemon
  alias PokeApiWeb.TypeJSON
  alias PokeApi.Pokemon.Type

  def create_type(conn, params) do
    case Pokemon.create_type(params) do
      {:ok, %Type{} = type} ->
        conn
        |> put_status(200)
        |> IO.inspect(label: "VALUE")
        |> put_view(TypeJSON)
        |> render("detail.json", %{type: type})
    end
  end

  def get_all_types(conn, _params) do
    types = Pokemon.get_all_types()

    conn
    |> put_status(200)
    |> put_view(TypeJSON)
    |> render("index.json", %{types: types})
  end
end
