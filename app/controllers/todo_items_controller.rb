class TodoItemsController < ApplicationController
  before_action :set_todo_item, except: [:create]

  def create
    @todo_list = TodoList.find(params[:todo_list_id])
    @todo_item = @todo_list.todo_items.build(todo_items_params)
    if @todo_item.save
      flash[:notice] = "Todo item created!"
      redirect_to @todo_list
    end
  end

  def destroy
    @todo_list = TodoList.find(@todo_item.todo_list_id)
    @todo_item.delete
    redirect_to @todo_list
  end

  def done
    @todo_list = TodoList.find(@todo_item.todo_list_id)
    @todo_item.update_attributes(done: true)
    redirect_to @todo_list
  end

  private

    def set_todo_item
      @todo_item = TodoItem.find(params[:id])
    end

    def todo_items_params
      params.require(:todo_item).permit(:content)
    end

end
