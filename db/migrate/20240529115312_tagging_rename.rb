class TaggingRename < ActiveRecord::Migration[7.1]
  def change
    rename_column :taggings, :album_id, :song_id
  end
end
