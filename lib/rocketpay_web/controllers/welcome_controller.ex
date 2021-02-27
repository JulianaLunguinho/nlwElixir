defmodule RocketpayWeb.WelcomeController do
  use RocketpayWeb, :controller

  alias Rocketpay.Numbers

  def index(conn, %{"filename" => filename}) do
    filename
    |> Numbers.sum_from_file()
    |> handle_response(conn)
  end

  defp handle_response({:ok, %{result: number}}, conn) do
    conn
    |> put_status(:ok)
    |> json(%{message: "Welcome to Rocket Api. Here is your number #{number}"})
  end

  defp handle_response({:error, erro}, conn) do
    conn
    |> put_status(:bad_request)
    |> json(erro)
  end

end
