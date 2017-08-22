require 'rails_helper'

RSpec.feature "TodoLists", type: :feature do

  feature "view all todo lists" do

    it "should render the page successfully" do
      visit "/todo_lists"
      expect(page).to have_http_status(:success)
      expect(page).to have_text("Your Todo Lists")
      expect(page).to have_text("First Todo List")
    end

  end

end
