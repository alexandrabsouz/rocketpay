defmodule RocketPay.Numbers do
  def sum_from_file(filename) do
    "#{filename}.csv"
    |> File.read()
    |> handle_file()
  end

  defp handle_file({:ok, string}) do
    result =
      string
      |> String.split(",")
      |> Stream.map(fn num -> String.to_integer(num) end)
      |> Enum.sum()
      |> Integer.to_string()

    {:ok, %{result: result}}
  end

  defp handle_file({:error, _reason}), do: {:error, %{message: "inválid file."}}
end
