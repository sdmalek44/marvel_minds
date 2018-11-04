require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it {should validate_presence_of :password_digest}
    it {should validate_presence_of :username}
  end
end
