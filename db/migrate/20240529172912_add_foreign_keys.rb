class AddForeignKeys < ActiveRecord::Migration[7.1]
  def change
    add_reference :songs, :mus_album, foreign_key: true
    add_reference :users, :mus_album, foreign_key: true
    add_reference :taggings, :mus_album, foreign_key: true
  end
end
