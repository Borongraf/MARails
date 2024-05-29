class AdduserIdToMusAlbum < ActiveRecord::Migration[7.1]
  def change
    add_column :mus_albums, :user_id, :bigint
  end
end
