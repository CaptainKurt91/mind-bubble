class TasksController < ApplicationController
  before_action :remember_page, only: [:index, :show]

  def new
    @category = Category.find(params[:category_id])
    @task = Task.new
  end

  def create
    @category = Category.find(params[:category_id])
    @task = Task.new(name: params[:task][:name])
    @task.category = @category
    @task.user = current_user
    @task.save
    redirect_to category_path(@category)
  end

  def show
    @task = Task.find(params[:id])
    @task_note = @task.task_notes.where("user_id = ?", current_user)
    @task_checklist = @task.task_checklists.where("user_id = ?", current_user)
    @output = @task_note + @task_checklist
    @sorted = @output.sort_by { |date| date.created_at }
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(name: params[:task][:name])
    @task.save
    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    @category = Category.find(@task[:category_id])
    redirect_to category_path(@category)
  end
end
