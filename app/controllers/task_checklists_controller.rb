class TaskChecklistsController < ApplicationController
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
    params.require(:task_checklist).permit(:name)
  end
end
