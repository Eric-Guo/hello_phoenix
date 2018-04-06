defmodule HelloWeb.SessionControllerTest do
  use HelloWeb.ConnCase

  test "GET /sessions/new", %{conn: conn} do
    conn = get conn, "/sessions/new"
    assert html_response(conn, 200) =~ "<h1>Login</h1>"
  end
end
