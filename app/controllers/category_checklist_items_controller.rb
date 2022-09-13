class CategoryChecklistItemsController < ApplicationController
  
  def show
    @category_checklist_item = CategoryChecklistItem.find(params[:id])
  end
  
  def new
    @category_checklist = CategoryChecklist.find(params[:category_checklist_id])
    @category_checklist_item = CategoryChecklistItem.new
  end

  def create
    @category_checklist = CategoryChecklist.find(params[:category_checklist_id])
    @category_checklist_item = CategoryChecklistItem.new(category_checklist_item_params)
    @category_checklist_item.category_checklist = @category_checklist
    @category_checklist_item.save

    redirect_to category_checklist_path(@category_checklist)
  end

  def destroy
    @category_checklist_item = CategoryChecklistItem.find(params[:id])
    @category_checklist_item.destroy

    @category_checklist = CategoryChecklist.find(@category_checklist_item[:category_checklist_id])
    redirect_to category_checklist_path(@category_checklist)
  end

  private

  def category_checklist_item_params
    params.require(:category_checklist_item).permit(:description)
  end
end
