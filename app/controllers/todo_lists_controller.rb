class TodoListsController < ApplicationController
  before_action :set_todo_list, only: [:edit, :update, :destroy, :show]

  def index
    @todo_lists = TodoList.all
  end

  def show
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

  def edit
  end

  def update
    if @todo_list.update_attributes(todo_list_params)
      flash[:notice] = "Todo List successfully updated"
      redirect_to todo_lists_url
    else
      render 'edit'
    end
  end

  def destroy
    @todo_list.delete
    redirect_to todo_lists_url
  end

  private

    def todo_list_params
      params.require(:todo_list).permit(:title, :description)
    end

    def set_todo_list
      @todo_list = TodoList.find(params[:id])
    end

end
