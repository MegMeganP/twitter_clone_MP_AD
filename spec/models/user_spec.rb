require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with name' do
    user = User.new(name: 'John')
    expect(user.name).to eq('John')
  end
  it 'is invalid without name' do
    user = User.new(name: nil)
    expect(user).to_not be_valid
  end
end
