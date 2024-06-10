defmodule TestLiveGenWeb.Router do
  use TestLiveGenWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {TestLiveGenWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TestLiveGenWeb do
    pipe_through :browser

    get "/", PageController, :home

    live "/a", ALive
  end

  # Other scopes may use custom stacks.
  # scope "/api", TestLiveGenWeb do
  #   pipe_through :api
  # end
end
