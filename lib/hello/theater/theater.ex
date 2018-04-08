defmodule Hello.Theater do
  @moduledoc """
  The Theater context.
  """

  import Ecto.Query, warn: false
  alias Hello.Repo

  alias Hello.Theater.Video

  def list_videos do
    Repo.all(Video)
  end

  def get_video!(id), do: Repo.get!(Video, id)

  def create_video(attrs \\ %{}) do
    %Video{}
    |> Video.changeset(attrs)
    |> Repo.insert()
  end

  def update_video(%Video{} = video, attrs) do
    video
    |> Video.changeset(attrs)
    |> Repo.update()
  end

  def delete_video(%Video{} = video) do
    Repo.delete(video)
  end

  def change_video(%Video{} = video) do
    Video.changeset(video, %{})
  end
end
