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
    @task_checklist.user = current_user
    @task_checklist.save

    redirect_to task_path(@task)
  end

  def show
    @checklist = TaskChecklist.find(params[:id])
    @items = @checklist.task_checklist_items
    @name = "task"
  end

  def edit
    @checklist = TaskChecklist.find(params[:id])
  end

  def update
    @checklist = TaskChecklist.find(params[:id])
    @checklist.update(name: params[:task_checklist][:name], end_date: params[:task_checklist][:end_date])
    @checklist.save
    redirect_to task_checklist_path(@checklist)
  end

  def destroy
    @checklist = TaskChecklist.find(params[:id])
    @task = Task.find(@checklist[:task_id])
    @checklist.destroy
    redirect_to task_path(@task)
  end

  private

  def task_checklist_params
    params.require(:task_checklist).permit(:name, :end_date)
  end
end
