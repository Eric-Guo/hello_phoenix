defmodule HelloWeb.UserControllerTest do
  use HelloWeb.ConnCase

  test "GET /users", %{conn: conn} do
    conn = get conn, "/users"
    assert html_response(conn, 302) =~ "You are being <a href=\"/\">redirected</a>."
  end
end
