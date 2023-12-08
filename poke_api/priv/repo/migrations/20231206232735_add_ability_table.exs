defmodule PokeApi.Repo.Migrations.AddAbilityTable do
  use Ecto.Migration

  def change do
    create table("abilities") do
      add(:name, :string)
      add(:description, :string)
    end
  end
end
