require "application_system_test_case"

class MusAlbumsTest < ApplicationSystemTestCase
  setup do
    @mus_album = mus_albums(:one)
  end

  test "visiting the index" do
    visit mus_albums_url
    assert_selector "h1", text: "Mus albums"
  end

  test "should create mus album" do
    visit mus_albums_url
    click_on "New mus album"

    fill_in "Description", with: @mus_album.description
    fill_in "Title", with: @mus_album.title
    click_on "Create Mus album"

    assert_text "Mus album was successfully created"
    click_on "Back"
  end

  test "should update Mus album" do
    visit mus_album_url(@mus_album)
    click_on "Edit this mus album", match: :first

    fill_in "Description", with: @mus_album.description
    fill_in "Title", with: @mus_album.title
    click_on "Update Mus album"

    assert_text "Mus album was successfully updated"
    click_on "Back"
  end

  test "should destroy Mus album" do
    visit mus_album_url(@mus_album)
    click_on "Destroy this mus album", match: :first

    assert_text "Mus album was successfully destroyed"
  end
end
