class Favorite < ApplicationRecord
  validates_presence_of :character_id, :name, :thumbnail
  belongs_to :user
end
