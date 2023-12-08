defmodule PokeApi.Pokemon do
  import Ecto.Query
  # alias Ecto.Multi
  alias PokeApi.Pokemon.Pokemon, as: PPokemon
  alias PokeApi.Repo
  alias PokeApi.Pokemon.Type, as: Type
  alias PokeApi.Pokemon.Ability, as: Ability

  @spec create_pokemon(map()) :: {:ok, PPokemon.t()} | {:error, Ecto.Changeset.t()}
  def create_pokemon(attrs \\ %{}) do
    %PPokemon{}
    |> PPokemon.changeset(attrs)
    |> Repo.insert()
  end

  def create_type(params \\ %{}) do
    %Type{}
    |> Type.changeset(params)
    |> Repo.insert()
  end

  def create_ability(params \\ %{}) do
    %Ability{}
    |> Ability.changeset(params)
    |> Repo.insert()
  end

  @spec create_type_if_not_exists(String.t()) :: {:ok, Type.t()} | {:error, Ecto.Changeset.t()}
  def create_type_if_not_exists(type_name) do
    case get_type(type_name) do
      %Type{} = type ->
        {:ok, type}

      _ ->
        create_type(%{name: type_name})
    end
  end

  def create_pokemon_with_type(pokemon \\ %{}) do
    IO.inspect(pokemon)
    type1 = Map.get(pokemon, "type1")
    type2 = Map.get(pokemon, "type2")

    type1_id =
      case create_type_if_not_exists(type1) do
        {:ok, %Type{id: type1_id}} ->
          type1_id

        _ ->
          nil
      end

    type2_id =
      case create_type_if_not_exists(type2) do
        {:ok, %Type{id: type2_id}} ->
          type2_id

        _ ->
          nil
      end

    pokemon
    |> Map.put("type1_id", type1_id)
    |> Map.put("type2_id", type2_id)
    |> create_pokemon()
  end

  @spec get_pokemon_by_id_or_name(String.t()) :: PPokemon.t() | nil
  def get_pokemon_by_id_or_name(id_or_name) do
    case Integer.parse(id_or_name) do
      {id, _} ->
        get_pokemon(id)

      _ ->
        get_pokemon(id_or_name)
    end
    |> IO.inspect(label: "POKE >>>")
  end

  @spec get_pokemon(String.t() | integer()) :: PPokemon.t() | nil
  def get_pokemon(identifier) do
    query = preload(PPokemon, [:type1, :type2, :abilities])

    query =
      if is_binary(identifier) do
        name = String.downcase(identifier)
        where(query, [p], fragment("lower(?)", p.name) == ^name)
      else
        where(query, [p], p.dex_number == ^identifier)
      end

    Repo.one(query) |> dbg()
  end

  @spec get_all() :: list()
  def get_all() do
    PPokemon
    |> preload([:type1, :type2])
    |> Repo.all()
  end

  @spec get_all_types() :: list()
  def get_all_types() do
    Repo.all(Type)
  end

  @spec get_type(String.t()) :: %Type{} | nil
  def get_type(type_name) do
    Type
    |> where([t], t.name == ^type_name)
    |> Repo.one()
  end

  @spec get_all_abilities() :: list()
  def get_all_abilities() do
    Repo.all(Ability)
  end
end
