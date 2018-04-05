defmodule HelloWeb.UserView do
  use HelloWeb, :view

  def first_name(%User{name: name}) do
    name
    |> String.split(" ")
    |> Enum.at(0)
  end
end
