class Tagging < ApplicationRecord
  belongs_to :song
  belongs_to :tag

  validates :song_id, presence: true
  validates :tag_id, presence: true
end
