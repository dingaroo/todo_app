class TodoList < ApplicationRecord
  validates :title, presence: true
  validates :archive, inclusion: { in: [ true, false ] }

  has_many :todo_items

end
