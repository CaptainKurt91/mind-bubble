class TaskChecklistsController < ApplicationController
  before_action :remember_page, only: [:index, :show]
  
  def new
    @task = Task.find(params[:task_id])
    @task_checklist = TaskChecklist.new
  end

  def create
    @task = Task.find(params[:task_id])
    @task_checklist = TaskChecklist.new(task_checklist_params)
    @task_checklist.task = @task
    @task_checklist.save

    redirect_to task_path(@task)
  end

  def show
    @task_checklist = TaskChecklist.find(params[:id])
  end

  private

  def task_checklist_params
    params.require(:task_checklist).permit(:name)
  end
end
