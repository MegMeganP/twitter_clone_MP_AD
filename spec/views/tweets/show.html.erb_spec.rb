require 'rails_helper'

RSpec.describe "tweets/show", type: :view do
  before(:each) do
    assign(:tweet, Tweet.create!(
      user: User.new(name: 'John', id: 1),
      message: "Message"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Message/)
  end
end
