class User < ApplicationRecord
  has_secure_password
  has_many :favorite_characters
  has_many :favorite_series
  validates_presence_of :password, :username
  validates_uniqueness_of :username
end
