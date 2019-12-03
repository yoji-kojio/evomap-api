require 'rails_helper'

describe User do
  subject { create(:user) }

  describe 'associations' do
    it { should have_many(:careers) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
  end
end