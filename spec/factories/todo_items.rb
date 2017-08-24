FactoryGirl.define do
  factory :todo_item do
    content "Study for exams"
    done false
    association :todo_list
  end
end
