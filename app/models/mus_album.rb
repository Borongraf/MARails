class MusAlbum < ApplicationRecord

  before_validation :set_default_title
  def set_default_title
    self.title ||= "Untitled album"
  end

  has_many :songs
  belongs_to :user
  has_rich_text :content
  has_one_attached :profile_image
  attribute :published, :boolean, default: false
  scope :published, -> { where(published: true) }

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "id", "title", "updated_at"]
  end
end
