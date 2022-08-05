defmodule RocketPayWeb.Router do
  use RocketPayWeb, :router

  alias RocketPayWeb.WelcomeController

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", RocketPayWeb do
    pipe_through :api
  end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]

      get "/:filename", WelcomeController, :index

      live_dashboard "/dashboard", metrics: RocketPayWeb.Telemetry
    end
  end









  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
