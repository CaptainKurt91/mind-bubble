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
    if @task_checklist.save
      redirect_to task_path(@task)
    else
      render :new, status: :unprocessable_entity
    end
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
    if @checklist.update(task_checklist_params)
      redirect_to task_checklist_path(@checklist)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @checklist = TaskChecklist.find(params[:id])
    @task = Task.find(@checklist[:task_id])
    @checklist.destroy
    redirect_to task_path(@task)
  end

  private

  def task_checklist_params
    params.require(:task_checklist).permit(:title, :end_date)
  end
end
