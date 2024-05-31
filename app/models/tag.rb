class Tag < ApplicationRecord
has_many :taggings
has_many :songs, through: :taggings

def self.ransackable_attributes(auth_object = nil)
  [
    "name"
  ]
end
end
