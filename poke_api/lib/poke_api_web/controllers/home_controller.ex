defmodule PokeApiWeb.HomeController do
  use PokeApiWeb, :controller

  def home(conn, %{"name" => name}) do
    data = %{
      success: true,
      name: name
    }

    conn
    |> put_status(200)
    |> json(data)
  end
end
