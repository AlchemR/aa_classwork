class Api::TodosController < ApplicationController

  def show
  render json: Todo.find(params[id])
  end

  def index
    # render json: Todo.all
  todoall = Todo.all

  render json: todoall
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      render json: @todo
    else
      render json: @todo.errors.full_messages, status: 422
    end
  end

#   def update
#     @todo = Todo.find(id: params[:id])
#     if (@todo)
    
#     else

#     end
#   end

#   def destroy

#   end

  def todo_params
    params.require(:todo).permit(:title, :body, :done)
  end

end
