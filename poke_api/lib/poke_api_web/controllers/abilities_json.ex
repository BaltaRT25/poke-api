defmodule PokeApiWeb.AbilitiesJSON do
  def detail(%{ability: ability}) do
    %{
      name: ability.name,
      description: ability.description
    }
  end

  def index(%{abilities: abilities}) do
    for ability <- abilities do
      detail(%{ability: ability})
    end
  end
end
