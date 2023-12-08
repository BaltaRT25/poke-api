defmodule PokeApi.Repo do
  use Ecto.Repo,
    otp_app: :poke_api,
    adapter: Ecto.Adapters.Postgres
end
