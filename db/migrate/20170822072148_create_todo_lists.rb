class CreateTodoLists < ActiveRecord::Migration[5.0]
  def change
    create_table :todo_lists do |t|
      t.string :title, null: false
      t.text :description
      t.boolean :archive, default: false

      t.timestamps
    end
  end
end
