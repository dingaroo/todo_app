require 'rails_helper'

RSpec.feature "TodoLists", type: :feature do

  feature "view all todo lists" do

    before :each do
      @todo_list = FactoryGirl.create(:todo_list)
    end

    it "should render the page successfully" do
      visit "/todo_lists"
      expect(page).to have_http_status(:success)
      expect(page).to have_text("Your Todo Lists")
      expect(page).to have_text(@todo_list.title)
    end

  end

end
