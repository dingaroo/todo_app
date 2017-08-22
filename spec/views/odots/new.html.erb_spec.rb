require 'rails_helper'

RSpec.describe "odots/new", type: :view do
  before(:each) do
    assign(:odot, Odot.new(
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new odot form" do
    render

    assert_select "form[action=?][method=?]", odots_path, "post" do

      assert_select "input#odot_title[name=?]", "odot[title]"

      assert_select "textarea#odot_description[name=?]", "odot[description]"
    end
  end
end
