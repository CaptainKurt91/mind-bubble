class ListsController < ApplicationController
  def new
    @component = Component.find(params[:component_id])
    @list = List.new
  end

  def create
    @component = Component.find(params[:component_id])
    @list = List.new(content: params[:list][:content])
    @list.component = @component
    @list.save
    redirect_to component_path(@component)
  end

  def edit
    @list = List.find(params[:id])
  end
  
  def update
    @list = List.find(params[:id])
    @list.update(content: params[:list][:content])
    @list.save
    @component = Component.find(@list[:component_id])
    redirect_to component_path(@component)
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    @component = Component.find(@list[:component_id])
    redirect_to component_path(@component)
  end
end
