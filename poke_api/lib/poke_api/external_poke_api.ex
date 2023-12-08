defmodule PokeApi.ExternalPokeApi do
  def get_pokemon(name) do
    url = "https://pokeapi.co/api/v2/pokemon/#{name}/"

    case Req.get(url) do
      {:ok, %{status: 200, body: body}} -> parse_pokemon_body(body)
      {:ok, %{status: 404}} -> %{error: "Not found"}
      {:error, error} -> %{error: inspect(error)}
    end
  end

  def parse_pokemon_body(body) do
    Map.take(body, ["id", "name"])
  end
end
