class TodoItemsController < ApplicationController

  def create
    @todo_list = TodoList.find(params[:todo_list_id])
    @todo_item = @todo_list.todo_items.build(todo_items_params)
    if @todo_item.save
      flash[:notice] = "Todo item created!"
      redirect_to @todo_list
    end
  end

  private

    def todo_items_params
      params.require(:todo_item).permit(:content)
    end

end
