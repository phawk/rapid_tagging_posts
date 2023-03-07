class Post < ApplicationRecord
  belongs_to :user

  validates :name, :body, presence: true

  def tags=(value)
    value = value.split(",").map(&:strip) if value.is_a?(String)
    super(value)
  end

  def self.find_by_tags(tags)
    array_of_tags = PG::TextEncoder::Array.new.encode(tags)
    where("tags ?| :tags", tags: array_of_tags)
  end
end
