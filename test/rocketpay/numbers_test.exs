defmodule RocketPay.NumbersTest do
  use ExUnit.Case

  alias RocketPay.Numbers

  describe "sum_from_file/1" do
    test "when filename is valid, returns the sum of values" do
      response = Numbers.sum_from_file("numbers")
      expected_response = {:ok, %{result: "38"}}

      assert response == expected_response
    end

    test "when filename is inválid, returns error file" do
      response = Numbers.sum_from_file("numberx")
      expected_response = {:error, %{message: "inválid file."}}

      assert response == expected_response
    end
  end
end
