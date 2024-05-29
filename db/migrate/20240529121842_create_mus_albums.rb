class CreateMusAlbums < ActiveRecord::Migration[7.1]
  def change
    create_table :mus_albums do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
