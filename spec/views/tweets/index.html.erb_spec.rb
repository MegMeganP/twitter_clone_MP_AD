require 'rails_helper'

RSpec.describe "tweets/index", type: :view do
  before(:each) do
    assign(:tweets, [
      Tweet.create!(
        user: User.new(name: 'John', id: 1),
        message: "Message"
      ),
      Tweet.create!(
        user: User.new(name: 'Mary', id: 2),
        message: "Message"
      )
    ])
  end

  it "renders a list of tweets" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('\d'), count: 2  # check if this is correct, is \d regex for int?
    assert_select cell_selector, text: Regexp.new("Message".to_s), count: 2
  end
end
