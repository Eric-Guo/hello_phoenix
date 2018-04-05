defmodule HelloWeb.UserController do
  use HelloWeb, :controller

  def index(conn, _params) do
    users = Hello.Repo.all(User)
    render conn, "index.html", users: users
  end

  def show(conn, %{"id" => id}) do
    user = Hello.Repo.get(User, id)
    render conn, "show.html", user: user
  end

  def new(conn, params) do
    changeset = User.changeset(%User{}, params)
    render conn, "new.html", changeset: changeset
  end
end
