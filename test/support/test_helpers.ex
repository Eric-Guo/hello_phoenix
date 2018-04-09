defmodule Hello.TestHelpers do
  alias Hello.Repo

  def insert_user(attrs \\ %{}) do
    changes = Map.merge(%{
      name: "Some User",
      username: "user#{Base.encode16(:crypto.strong_rand_bytes(8))}", password: "supersecret",
    }, attrs)

    %Hello.User{}
    |> Hello.User.registration_changeset(changes)
    |> Repo.insert!()
  end
end
