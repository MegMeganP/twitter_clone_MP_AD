require 'rails_helper'

RSpec.describe "tweets/edit", type: :view do
  let(:tweet) {
    Tweet.create!(
      user: User.new(name: 'John', id: 1),
      message: "MyString"
    )
  }

  before(:each) do
    assign(:tweet, tweet)
  end

  it "renders the edit tweet form" do
    render

    assert_select "form[action=?][method=?]", tweet_path(tweet), "post" do

      assert_select "input[name=?]", "tweet[user_id]"

      assert_select "input[name=?]", "tweet[message]"
    end
  end
end
