defmodule PokeApiWeb.TypeJSON do
  def detail(%{type: type}) do
    %{
      name: type.name
    }
  end

  def index(%{types: types}) do
    for type <- types do
      detail(%{type: type})
    end
  end
end
