require 'rails_helper'

RSpec.describe Tweet, type: :model do
  #is there a way to greate a user for all of the tests that need it in one spot?
  before do
    puts 'hello world'
    user = User.create(name: 'John')
    @tweet = Tweet.new(message: 'Hello, world!', user_id: user.id)
  end

  it 'is valid with a message' do
    expect(@tweet).to be_valid
  end
  it 'is invalid without a message' do
    @tweet.message = nil
    expect(@tweet).to_not be_valid
  end
  it 'is invalid with message longer than 240 characters' do
    @tweet.message = 'a' * 241
    expect(@tweet).to_not be_valid
  end
  it 'is valid with message less than or equal to 240 characters' do
    @tweet.message = 'a' * 240
    expect(@tweet).to be_valid
  end
  it 'is valid with a user' do
    expect(@tweet).to be_valid
  end
  it 'is invalid without a user' do
    @tweet.user_id = nil
    expect(@tweet).to_not be_valid
  end
end
