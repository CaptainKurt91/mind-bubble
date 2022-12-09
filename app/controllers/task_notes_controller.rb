class TaskNotesController < ApplicationController
  before_action :remember_page, only: [:index, :show]

  def new
    @task = Task.find(params[:task_id])
    @task_note = TaskNote.new
  end

  def create
    @task = Task.find(params[:task_id])
    @task_note = TaskNote.new(task_note_params)
    @task_note.task = @task
    @task_note.user = current_user
    @task_note.save

    redirect_to task_path(@task)
  end

  def show
    @note = TaskNote.find(params[:id])
  end

  def edit
    @note = TaskNote.find(params[:id])
  end

  def update
    @note = TaskNote.find(params[:id])
    @note.update(name: params[:task_note][:name], content: params[:task_note][:content], end_date: params[:task_note][:end_date])
    @note.save
    redirect_to task_note_path(@note)
  end

  def destroy
    @note = TaskNote.find(params[:id])
    @task = Task.find(@note[:task_id])
    @note.destroy
    redirect_to task_path(@task)
  end

  private

  def task_note_params
    params.require(:task_note).permit(:name, :content, :end_date)
  end
end
