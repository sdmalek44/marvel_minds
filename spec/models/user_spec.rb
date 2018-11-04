require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it {should validate_presence_of :password}
    it {should validate_presence_of :username}
  end
end
