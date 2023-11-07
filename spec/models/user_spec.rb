require 'rails_helper'


RSpec.describe User, type: :model do
  let(:user1) {create :user, email: :nil}
  it "should be valid user with all attributes" do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end

  it  'should have email and password' do 
    expect(user1.email).to eq(user1.email)
  end
end







