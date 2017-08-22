require 'rails_helper'

RSpec.describe "odots/edit", type: :view do
  before(:each) do
    @odot = assign(:odot, Odot.create!(
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit odot form" do
    render

    assert_select "form[action=?][method=?]", odot_path(@odot), "post" do

      assert_select "input#odot_title[name=?]", "odot[title]"

      assert_select "textarea#odot_description[name=?]", "odot[description]"
    end
  end
end
