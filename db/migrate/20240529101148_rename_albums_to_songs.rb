class RenameAlbumsToSongs < ActiveRecord::Migration[7.1]
    def change
      remove_column :albums, :price
      rename_table :albums, :songs
    end
  end
