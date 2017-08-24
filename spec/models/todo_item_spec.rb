require 'rails_helper'

RSpec.describe TodoItem, type: :model do

  context "validation" do

    let(:todo_item) { FactoryGirl.build(:todo_item) }

    it "should be valid" do
      expect(todo_item).to be_valid
    end

    it "should not be valid if content is missing" do
      todo_item.content = "    "
      expect(todo_item).to_not be_valid
    end

  end

end
