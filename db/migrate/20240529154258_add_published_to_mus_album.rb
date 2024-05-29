class AddPublishedToMusAlbum < ActiveRecord::Migration[7.1]
  def change
    add_column :mus_albums, :published, :boolean
  end
end
