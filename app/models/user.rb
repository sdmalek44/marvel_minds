class User < ApplicationRecord
  validates_presence_of :password_digest, :username, :auth_token
  validates_uniqueness_of :username, :auth_token
  has_secure_token :auth_token
  has_secure_password
end
