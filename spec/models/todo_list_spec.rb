require 'rails_helper'

RSpec.describe TodoList, type: :model do

  let(:todo_list) { FactoryGirl.build(:todo_list) }

  context "validations" do

    it "should be valid" do
      expect(todo_list).to be_valid
    end

    it "is not valid when title is missing" do
      todo_list.title = "   "
      expect(todo_list).to_not be_valid
    end

  end

  context "default value" do

    it "archive should default to false" do
      todo_list.save
      expect(todo_list.archive).to eq false
    end
  end

end
