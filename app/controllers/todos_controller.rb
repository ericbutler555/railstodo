class TodosController < ApplicationController

  def index
    @todo = Todo.new
    @new  = Todo.where(category_id: 1, is_done: false)
    @do   = Todo.where(category_id: 2, is_done: false)
    @can  = Todo.where(category_id: 3, is_done: false)
    @hold = Todo.where(category_id: 4, is_done: false)
    @back = Todo.where(category_id: 5, is_done: false)
    @done = Todo.where(is_done: true)
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      flash[:notice] = "Saved."
    else
      flash[:alert] = "Unable to save"
    end
    redirect_back(fallback_location: root_path)
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      flash[:notice] = "Updated."
    else
      flash[:alert] = "Unable to update"
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @todo = Todo.find(params[:id])
    if @todo.destroy
      flash[:notice] = "Deleted."
    else
      flash[:alert] = "Unable to delete"
    end
    redirect_back(fallback_location: root_path)
  end

  def toggle_done
    @todo = Todo.find(params[:id])
    opposite = !@todo.is_done
    @todo.update(is_done: opposite)
    redirect_back(fallback_location: root_path)
  end

  private

    def todo_params
      params.require(:todo).permit(:body, :category_id)
    end

end
