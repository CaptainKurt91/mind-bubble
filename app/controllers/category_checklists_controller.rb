class CategoryChecklistsController < ApplicationController
  def new
    @category = Category.find(params[:category_id])
    @category_checklist = CategoryChecklist.new
  end

  def create
    @category = Category.find(params[:category_id])
    @category_checklist = CategoryChecklist.new(category_checklist_params)
    @category_checklist.category = @category
    @category_checklist.save

    redirect_to category_path(@category)
  end

  def show
    @category_checklist = CategoryChecklist.find(params[:id])
  end

  private

  def category_checklist_params
    params.require(:category_checklist).permit(:name)
  end
end
