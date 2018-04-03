defmodule HelloWeb.UserView do
  use HelloWeb, :view
  alias Hello.User

  def first_name(%User{name: name}) do
    name
    |> String.split(" ")
    |> Enum.at(0)
  end
end
