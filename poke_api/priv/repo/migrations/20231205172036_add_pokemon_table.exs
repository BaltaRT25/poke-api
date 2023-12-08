defmodule PokeApi.Repo.Migrations.AddPokemonTable do
  use Ecto.Migration

  def change do
    create table(:pokemon) do
      add(:dex_number, :integer)
      add(:name, :string)
    end
  end
end
