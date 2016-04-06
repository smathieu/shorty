defmodule Shorty.Router do
  use Shorty.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Shorty do
    pipe_through :browser # Use the default browser stack

    get "/", LinkController, :index
    get "/:key", LinkController, :show, as: :shortlink

    resources "/links", LinkController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Shorty do
  #   pipe_through :api
  # end
end
