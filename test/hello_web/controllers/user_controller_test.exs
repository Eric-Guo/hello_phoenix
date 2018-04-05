defmodule HelloWeb.UserControllerTest do
  use HelloWeb.ConnCase

  test "GET /users", %{conn: conn} do
    conn = get conn, "/users"
    assert html_response(conn, 200) =~ "Listing Users"
  end
end
