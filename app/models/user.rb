class User < ApplicationRecord
  has_secure_password
  has_many :favorites
  validates_presence_of :password, :username
  validates_uniqueness_of :username
end
