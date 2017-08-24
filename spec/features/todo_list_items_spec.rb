require 'rails_helper'

RSpec.feature "TodoListItems", type: :feature do

  feature "create todo list items" do

    it "should be able to create todo list items from todo list show page" do
      todo_list = FactoryGirl.create(:todo_list, title: "Personal learning", description: "List of things I have to do for personal learning")
      visit todo_list_path(todo_list)
      expect(page).to have_http_status(:success)
      expect(page).to have_text(todo_list.title)
      expect do
        fill_in "Content", with: "Study for Ruby examination"
        click_button "Add Item"
      end.to change{ TodoItem.count }.by(1)
      expect(current_path).to eq todo_list_path(todo_list)
      expect(page).to have_text("Study for Ruby examination")
    end

  end

  feature "delete todo list items" do

    it "should be able to delete todo list items from todo list show page" do
      todo_list = FactoryGirl.create(:todo_list, title: "Personal learning", description: "List of things I have to do for personal learning")
      todo_item = FactoryGirl.create(:todo_item, content: "Study for Ruby examination", todo_list: todo_list)
      visit todo_list_path(todo_list)
      expect(page).to have_http_status(:success)
      expect(page).to have_text(todo_list.title)
      expect(page).to have_text(todo_item.content)
      expect do
        click_link "delete_todo_item_#{todo_item.id}"
      end.to change{ TodoItem.count }.by(-1)
      expect(current_path).to eq todo_list_path(todo_list)
    end

  end

  feature "mark item as done" do

    it "should be able to mark item as done" do
      todo_list = FactoryGirl.create(:todo_list, title: "Personal learning", description: "List of things I have to do for personal learning")
      todo_item = FactoryGirl.create(:todo_item, content: "Study for Ruby examination", todo_list: todo_list)
      visit todo_list_path(todo_list)
      expect(page).to have_http_status(:success)
      expect(page).to have_text(todo_list.title)
      expect(page).to have_text(todo_item.content)
      click_link "mark_as_done_#{todo_item.id}"
      todo_item.reload
      expect(todo_item.done).to be true
    end
  end

end
