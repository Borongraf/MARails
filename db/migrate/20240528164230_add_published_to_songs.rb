class AddPublishedToSongs < ActiveRecord::Migration[7.1]
  def change
    add_column :songs, :published, :boolean
  end
end
