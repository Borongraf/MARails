class Tagging < ApplicationRecord
    belongs_to :song
    belongs_to :mus_album
    belongs_to :tag
  end