defmodule RocketPayWeb.WelcomeController do
  use RocketPayWeb, :controller

  alias RocketPay.Numbers

  def index(conn, %{"filename" => filename}) do
    filename
    |> Numbers.sum_from_file()
    |> IO.inspect()
    |> handle_response(conn)
  end

  defp handle_response({:ok, %{result: result}}, conn) do
    conn
    |> put_status(:ok)
    |> json(%{message: "Welcome to RocketPay API. Here is your number #{result}"})
  end

  defp handle_response({:error, %{message: result}}, conn) do
    conn
    |> put_status(:bad_request)
    |> json(%{message: result})
  end
end
