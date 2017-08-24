FactoryGirl.define do
  factory :todo_item do
    content "MyString"
    done false
    todo_list nil
  end
end
