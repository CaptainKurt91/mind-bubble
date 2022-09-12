class TasksController < ApplicationController
  def new
    @category = Category.find(params[:category_id])
    @task = Task.new
  end

  def create
    @category = Category.find(params[:category_id])
    @task = Task.new(name: params[:task][:name])
    @task.category = @category
    @task.save
    redirect_to category_path(@category)
  end

  def show
    @task = Task.find(params[:id])
    # @components = @task.components
  end
end
