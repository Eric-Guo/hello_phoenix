defmodule HelloWeb.UserController do
  use HelloWeb, :controller

  def index(conn, _params) do
    users = Hello.Repo.all(HelloWeb.User)
    render conn, "index.html", users: users
  end
end
