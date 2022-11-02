require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do; end 

  describe 'validations' do
    it {
      should validate_presence_of :email
      should validate_uniqueness_of :email
    }
  end
end
