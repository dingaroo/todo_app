require 'rails_helper'

RSpec.feature "TodoListItems", type: :feature do

  feature "create todo list items" do

    it "should be able to create todo list items from todo list show page" do
      todo_list = FactoryGirl.create(:todo_list, title: "Personal learning", description: "List of things I have to do for personal learning")
      visit todo_list_path(todo_list)
      expect(page).to have_http_status(:success)
      expect(page).to have_text(todo_list.title)
      expect do
        fill_in "content", with: "Study for Ruby examination"
        click_button "Add Item"
      end.to change{ TodoItem.count }.by(1)
    end

  end

end
