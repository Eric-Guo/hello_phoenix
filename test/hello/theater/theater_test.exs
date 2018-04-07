defmodule Hello.TheaterTest do
  use Hello.DataCase

  alias Hello.Theater

  describe "videos" do
    alias Hello.Theater.Video

    @valid_attrs %{description: "ElixirConfEU 2015 Keynote", title: "Phoenix Takes Flight", url: "https://www.youtube.com/watch?v=u21S_vq5CTw"}
    @update_attrs %{description: "some updated description", title: "some updated title", url: "some updated url"}
    @invalid_attrs %{description: nil, title: nil, url: nil}

    def video_fixture(attrs \\ %{}) do
      {:ok, video} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Theater.create_video()

      video
    end

    test "list_videos/0 returns all videos" do
      video = video_fixture()
      assert Theater.list_videos() == [video]
    end

    test "get_video!/1 returns the video with given id" do
      video = video_fixture()
      assert Theater.get_video!(video.id) == video
    end

    test "create_video/1 with valid data creates a video" do
      assert {:ok, %Video{} = video} = Theater.create_video(@valid_attrs)
      assert video.description == "ElixirConfEU 2015 Keynote"
      assert video.title == "Phoenix Takes Flight"
      assert video.url == "https://www.youtube.com/watch?v=u21S_vq5CTw"
    end

    test "create_video/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Theater.create_video(@invalid_attrs)
    end

    test "update_video/2 with valid data updates the video" do
      video = video_fixture()
      assert {:ok, video} = Theater.update_video(video, @update_attrs)
      assert %Video{} = video
      assert video.description == "some updated description"
      assert video.title == "some updated title"
      assert video.url == "some updated url"
    end

    test "update_video/2 with invalid data returns error changeset" do
      video = video_fixture()
      assert {:error, %Ecto.Changeset{}} = Theater.update_video(video, @invalid_attrs)
      assert video == Theater.get_video!(video.id)
    end

    test "delete_video/1 deletes the video" do
      video = video_fixture()
      assert {:ok, %Video{}} = Theater.delete_video(video)
      assert_raise Ecto.NoResultsError, fn -> Theater.get_video!(video.id) end
    end

    test "change_video/1 returns a video changeset" do
      video = video_fixture()
      assert %Ecto.Changeset{} = Theater.change_video(video)
    end
  end
end
