class TaskNotesController < ApplicationController
  def new
    @task = Task.find(params[:task_id])
    @task_note = TaskNote.new
  end

  def create
    @task = Task.find(params[:task_id])
    @task_note = TaskNote.new(task_note_params)
    @task_note.task = @task
    # @task_note.user = current_user
    @task_note.save

    redirect_to task_path(@task)
  end

  def show
    @task_note = TaskNote.find(params[:id])
  end

  private

  def task_note_params
    params.require(:task_note).permit(:name, :content)
  end
end
