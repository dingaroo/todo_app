require 'rails_helper'

RSpec.feature "TodoLists", type: :feature do

  feature "view all todo lists" do

    before :each do
      @todo_list_1 = FactoryGirl.create(:todo_list, title: "Personal learning", description: "List of things I have to do for personal learning")
      @todo_list_2 = FactoryGirl.create(:todo_list, title: "Work", description: "Work list items")
      @todo_list_3 = FactoryGirl.create(:todo_list, title: "Home", description: "List of home items to do")
    end

    it "should render the page successfully with all the todo list items" do
      visit "/todo_lists"
      expect(page).to have_http_status(:success)
      expect(page).to have_text("Your Todo Lists")
      todo_lists = TodoList.all
      todo_lists.each do |todo_list|
        expect(page).to have_text(todo_list.title)
      end
    end

  end

  feature "create a todo list" do

    it "should create one todo list" do
      visit "/todo_lists/new"
      expect(page).to have_http_status(:success)
      expect(page).to have_text("Create New Todo List")
      fill_in "Title", with: "School Work"
      fill_in "Description", with: "List of projects / readings to do"
      click_button "Create Todo List"

      expect(current_path).to eq "/todo_lists"
      expect(page).to have_text("School Work")
      expect(TodoList.where(title: "School Work").count).to eq 1
    end
  end

end
