class TodoListsController < ApplicationController

  def index
    @todo_lists = TodoList.all
  end

  def new
    @todo_list = TodoList.new
  end

  def create
    @todo_list = TodoList.new(todo_list_params)
    if @todo_list.save
      flash[:notice] = "Todo List successfully created"
      redirect_to todo_lists_url
    else
      render 'new'
    end
  end

  def destroy
    TodoList.find(params[:id]).delete
    redirect_to todo_lists_url
  end

  private

    def todo_list_params
      params.require(:todo_list).permit(:title, :description)
    end

end
