class Api::TodosController < ApplicationController
  
  def create
    @todo  = Todo.new(todo_params)
    
    if @todo.save
      render json: @todo
    else
      render json: @todo.errors, status: :unprocessable_entity
    end    
  end
  
  def destroy
    @todo = Todo.find(params[:id])
    if @todo.destroy
      render json: @todo
    else
      raise "wtf?"
    end
  end
  
  def index
    @todos = Todo.all
    render json: @todos
  end
  
  def show
    @todo = Todo.find(params[:id])
    render json: @todo
  end
  
  def update
    @todo = Todo.find(params[:id])
    if @todo.update_attributes(todo_params)
      render json: @todo
    else
      render json: @todo.errors, status: 422
    end
  end
  
  private
  
  def todo_params
    params.require(:todo).permit(:title)
  end
end