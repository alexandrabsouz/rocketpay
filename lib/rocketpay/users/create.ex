defmodule RocketPay.Users.Create do
  @moduledoc false
  
  alias RocketPay.{Repo, User}


  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
