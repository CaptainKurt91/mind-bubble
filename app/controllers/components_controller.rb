class ComponentsController < ApplicationController
  def new
    @task = Task.find(params[:task_id])
    @component = Component.new
  end

  def create
    @task = Task.find(params[:task_id])
    @component = Component.new(name: params[:component][:name])
    @component.task = @task
    @component.save
    redirect_to task_path(@task)
  end
end
