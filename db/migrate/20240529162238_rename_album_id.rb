class RenameAlbumId < ActiveRecord::Migration[7.1]
  def change
    rename_column :taggings, :album_id, :mus_album_id
  end
end