class TaskChecklistItemsController < ApplicationController
  def new
    @task_checklist = TaskChecklist.find(params[:task_checklist_id])
    @task_checklist_item = TaskChecklistItem.new
  end

  def create
    @task_checklist = TaskChecklist.find(params[:task_checklist_id])
    @task_checklist_item = TaskChecklistItem.new(task_checklist_item_params)
    @task_checklist_item.task_checklist = @task_checklist
    @task_checklist_item.save

    redirect_to task_checklist_path(@task_checklist)
  end

  def edit
    @task_checklist = TaskChecklist.find(params[:id])
    @task_checklist_item = TaskChecklistItem.find(params[:task_checklist_id])
  end

  def update
    @task_checklist = TaskChecklist.find(params[:task_checklist_id])
    @task_checklist_item = TaskChecklistItem.find(params[:id])
    @task_checklist_item.update(task_checklist_item_params)
    @task_checklist_item.save

    redirect_to task_checklist_path(@task_checklist)
  end


  def update_checklist
    @task_checklist_item = TaskChecklistItem.find(params[:id])
    @task_checklist_item.update(task_checklist_item_params)
    @task_checklist_item.save

    respond_to do |format|
      format.js
    end
  end

  def destroy
    @task_checklist_item = TaskChecklistItem.find(params[:id])
    @task_checklist_item.destroy

    @task_checklist = TaskChecklist.find(@task_checklist_item[:task_checklist_id])
    redirect_to task_checklist_path(@task_checklist)
  end

  private

  def task_checklist_item_params
    params.require(:task_checklist_item).permit(:description, :state)
  end
end
