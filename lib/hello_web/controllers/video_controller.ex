defmodule HelloWeb.VideoController do
  use HelloWeb, :controller

  alias Hello.Theater
  alias Hello.Theater.Video

  plug :scrub_params, "video" when action in [:create, :update]

  def index(conn, _params, user) do
    videos = Theater.list_videos()
    render(conn, "index.html", videos: videos)
  end

  def new(conn, _params, user) do
    changeset = Theater.change_video(user, %Video{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"video" => video_params}, user) do
    case Theater.create_video(video_params) do
      {:ok, video} ->
        conn
        |> put_flash(:info, "Video created successfully.")
        |> redirect(to: Routes.video_path(conn, :show, video))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}, user) do
    video = Theater.get_video!(id)
    render(conn, "show.html", video: video)
  end

  def edit(conn, %{"id" => id}, user) do
    video = Theater.get_video!(id)
    changeset = Theater.change_video(user, video)
    render(conn, "edit.html", video: video, changeset: changeset)
  end

  def update(conn, %{"id" => id, "video" => video_params}, user) do
    video = Theater.get_video!(id)

    case Theater.update_video(video, video_params) do
      {:ok, video} ->
        conn
        |> put_flash(:info, "Video updated successfully.")
        |> redirect(to: Routes.video_path(conn, :show, video))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", video: video, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}, user) do
    video = Theater.get_video!(id)
    {:ok, _video} = Theater.delete_video(video)
    conn
    |> put_flash(:info, "Video deleted successfully.")
    |> redirect(to: Routes.video_path(conn, :index))
  end

  def action(conn, _) do
    apply(__MODULE__, action_name(conn),
          [conn, conn.params, conn.assigns.current_user])
  end
end
