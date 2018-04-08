defmodule Hello.Theater.Video do
  @moduledoc """
  The Theater Video model.
  """

  use Ecto.Schema
  import Ecto.Changeset


  schema "videos" do
    field :description, :string
    field :title, :string
    field :url, :string
    field :view_count, :integer, default: 0
    belongs_to :user, Hello.User

    timestamps()
  end

  @doc false
  def changeset(video, attrs) do
    video
    |> cast(attrs, [:url, :title, :description])
    |> validate_required([:url, :title, :description])
  end
end
