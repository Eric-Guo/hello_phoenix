defmodule HelloWeb.UserController do
  use HelloWeb, :controller
  plug :authenticate when action in [:index, :show]

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

  def create(conn, %{"user" => user_params}) do
    changeset = User.registration_changeset(%User{}, user_params)
    case Hello.Repo.insert(changeset) do
      {:ok, user} ->
        conn
        |> HelloWeb.Auth.login(user)
        |> put_flash(:info, "#{user.name} created!")
        |> redirect(to: Routes.user_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  defp authenticate(conn, _opts) do
    if conn.assigns.current_user do
      conn
    else
      conn
      |> put_flash(:error, "You must be logged in to access that page")
      |> redirect(to: Routes.page_path(conn, :index))
      |> halt()
    end
  end
end
