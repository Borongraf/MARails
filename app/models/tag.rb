class Tag < ApplicationRecord
has_many :taggings
has_many :songs, through: :taggings
has_many :mus_albums, through: :taggings

def self.ransackable_attributes(auth_object = nil)
  [
    "name"
  ]
end
end
