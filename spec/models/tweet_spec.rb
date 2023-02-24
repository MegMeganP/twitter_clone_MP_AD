require 'rails_helper'

RSpec.describe Tweet, type: :model do
  #is there a way to greate a user for all of the tests that need it in one spot?
  it 'is valid with a message' do
    user = User.create(name: 'John', id: 1)
    tweet = Tweet.new(message: 'Hello, world!', user_id: 1)
    expect(tweet).to be_valid
  end
  it 'is invalid without a message' do
    tweet = Tweet.new(message: nil)
    expect(tweet).to_not be_valid
  end
  it 'is invalid with message longer than 240 characters' do
    tweet = Tweet.new(message: 'a' * 241)
    expect(tweet).to_not be_valid
  end
  it 'is valid with message less than or equal to 240 characters' do
    user = User.create(name: 'John', id: 1)
    tweet = Tweet.new(message: 'a' * 240, user_id: 1)
    expect(tweet).to be_valid
  end
  it 'is valid with a user' do
    user = User.create(name: 'John', id: 1)
    tweet = Tweet.new(user_id: 1)
    expect(tweet).to be_valid
  end
  it 'is invalid without a user' do
    tweet = Tweet.new(user_id: nil)
    expect(tweet).to_not be_valid
  end
end
