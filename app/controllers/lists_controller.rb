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
end
