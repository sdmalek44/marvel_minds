class User < ApplicationRecord
  has_secure_password
  has_secure_token :auth_token
  validates_presence_of :password_digest, :username
  validates_uniqueness_of :username
end
