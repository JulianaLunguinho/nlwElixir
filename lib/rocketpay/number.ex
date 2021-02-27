defmodule Rocketpay.Numbers do
  
  def sum_from_file(fileName) do
    "#{fileName}.csv"
    |> File.read()
    |> handle_file()
  end

  defp handle_file({:ok, result}) do
    result =
      result
      |> String.split(",")
      |> Stream.map(fn number -> String.to_integer(number) end)
      |> Enum.sum()

      {:ok, %{result: result}}
  end

  defp handle_file({:error, _erro}), do: {:error, %{message: "File not found"}}
end
