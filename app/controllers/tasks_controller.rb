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
    @task_note = @task.task_notes
    @task_checklist = @task.task_checklists
    @output = @task_note + @task_checklist
    @sorted = @output.sort_by { |date| date.created_at }
  end
end
