class AddForeignKeys < ActiveRecord::Migration[7.1]
  def change
    remove_column :mus_albums, :user_id, :integer
    remove_column :songs, :album_id, :integer
    remove_column :taggings, :mus_album_id, :integer

    add_reference :mus_albums, :user, foreign_key: true
    add_reference :songs, :mus_album, foreign_key: true
    add_reference :taggings, :mus_album, foreign_key: true
  end
end
