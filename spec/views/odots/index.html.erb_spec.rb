require 'rails_helper'

RSpec.describe "odots/index", type: :view do
  before(:each) do
    assign(:odots, [
      Odot.create!(
        :title => "Title",
        :description => "MyText"
      ),
      Odot.create!(
        :title => "Title",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of odots" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
