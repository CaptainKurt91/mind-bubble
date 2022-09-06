class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    @category_task = CategoryTask.new
    @category = Category.find(params[:category_id])
    @task = Task.create(name: params[:name])
    @ca
    @category.task = @task
    @category.save
    redirect_to category_path(@categorie)
  end
end
