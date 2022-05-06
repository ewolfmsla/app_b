defmodule AppBWeb.Router do
  use AppBWeb, :router

  # pipeline :api do
  #   plug(CORSPlug)
  #   plug :accepts, ["json"]
  # end

  # scope "/api" do
  #   pipe_through :api

  #   forward "/graphiql", Absinthe.Plug.GraphiQL, schema: AppB.Schema

  #   forward "/", Absinthe.Plug, schema: AppB.Schema
  # end

  pipeline :api do
    plug(CORSPlug)
    plug :accepts, ["json"]
  end

  scope "/graphiql" do
    pipe_through :api
    forward "/", Absinthe.Plug.GraphiQL, schema: AppB.Schema
  end

  scope "/api" do
    pipe_through :api

    forward "/", Absinthe.Plug, schema: AppB.Schema
  end
end
