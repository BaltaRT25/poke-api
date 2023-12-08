defmodule PokeApi.Repo.Migrations.AddTypeTable do
  use Ecto.Migration

  def change do
    create table("types") do
      add(:name, :string)
    end
  end
end
