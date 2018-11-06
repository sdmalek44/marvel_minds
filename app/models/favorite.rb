class Favorite < ApplicationRecord
  validates_presence_of :character_id, :description, :name, :thumbnail
  belongs_to :user
end
