defmodule PokeApiWeb.Router do
  use PokeApiWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/api", PokeApiWeb do
    pipe_through(:api)

    scope "/pokemon" do
      get("/", PokemonController, :get_all)
      get("/:id_or_name", PokemonController, :get_pokemon)
      # post("/create", PokemonController, :create_pokemon)
      post("/create", PokemonController, :create_pokemon_with_type)
    end

    scope "/types" do
      get("/", TypesController, :get_all_types)
      post("/create", TypesController, :create_type)
    end

    scope "/abilities" do
      get("/", AbilitiesController, :get_all_abilities)
      post("/create", AbilitiesController, :create_ability)
    end
  end

  # Enable LiveDashboard in development
  if Application.compile_env(:poke_api, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through([:fetch_session, :protect_from_forgery])

      live_dashboard("/dashboard", metrics: PokeApiWeb.Telemetry)
    end
  end
end
