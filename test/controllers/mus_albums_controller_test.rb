require "test_helper"

class MusAlbumsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mus_album = mus_albums(:one)
  end

  test "should get index" do
    get mus_albums_url
    assert_response :success
  end

  test "should get new" do
    get new_mus_album_url
    assert_response :success
  end

  test "should create mus_album" do
    assert_difference("MusAlbum.count") do
      post mus_albums_url, params: { mus_album: { description: @mus_album.description, title: @mus_album.title } }
    end

    assert_redirected_to mus_album_url(MusAlbum.last)
  end

  test "should show mus_album" do
    get mus_album_url(@mus_album)
    assert_response :success
  end

  test "should get edit" do
    get edit_mus_album_url(@mus_album)
    assert_response :success
  end

  test "should update mus_album" do
    patch mus_album_url(@mus_album), params: { mus_album: { description: @mus_album.description, title: @mus_album.title } }
    assert_redirected_to mus_album_url(@mus_album)
  end

  test "should destroy mus_album" do
    assert_difference("MusAlbum.count", -1) do
      delete mus_album_url(@mus_album)
    end

    assert_redirected_to mus_albums_url
  end
end
