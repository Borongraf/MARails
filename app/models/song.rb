class Song < ApplicationRecord
  before_validation :set_default_title

  def set_default_title
    self.title ||= "Untitled Song"
  end

  has_rich_text :content
  has_one_attached :profile_image
  belongs_to :user
  has_one_attached :audio
  has_many :taggings
  has_many :tags, through: :taggings
  attribute :published, :boolean, default: false
  scope :published, -> { where(published: true) }

  def all_tags=(names)
    self.tags = names.split(",").map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end

  def self.ransackable_associations(auth_object = nil)
    ["tags", "user"] # Added "user" to make related search possible
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "id", "title", "updated_at", "published", "user_id"]
  end
end
