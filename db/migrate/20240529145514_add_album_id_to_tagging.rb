class AddAlbumIdToTagging < ActiveRecord::Migration[7.1]
    def change
      add_column :taggings, :album_id, :bigint
    end
  end
