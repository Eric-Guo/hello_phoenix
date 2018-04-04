defmodule Hello.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :name, :string
    field :password, :string
    field :password_hash, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(user, params \\ :empty) do
    user
    |> cast(params, ~w(name username), [])
    |> validate_length(:username, min: 1, max: 20)
  end
end
