defmodule HelloWeb.UserController do
  use HelloWeb, :controller

  def index(conn, _params) do
    users = Hello.Repo.all(Hello.User)
    render conn, "index.html", users: users
  end

  def show(conn, %{"id" => id}) do
    user = Hello.Repo.get(Hello.User, id)
    render conn, "show.html", user: user
  end
end
