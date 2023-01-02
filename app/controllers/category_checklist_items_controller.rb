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
    @category_checklist_item.user = current_user
    if @category_checklist_item.save
      redirect_to category_checklist_path(@category_checklist)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @category_checklist = CategoryChecklist.find(params[:id])
    @category_checklist_item = CategoryChecklistItem.find(params[:category_checklist_id])
  end

  def update
    @category_checklist = CategoryChecklist.find(params[:category_checklist_id])
    @category_checklist_item = CategoryChecklistItem.find(params[:id])
    if @category_checklist_item.update(category_checklist_item_params)
      redirect_to category_checklist_path(@category_checklist) if params[:category_checklist_item][:title]
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category_checklist_item = CategoryChecklistItem.find(params[:id])
    @category_checklist_item.destroy

    @category_checklist = CategoryChecklist.find(@category_checklist_item[:category_checklist_id])
    redirect_to category_checklist_path(@category_checklist)
  end

  private

  def category_checklist_item_params
    params.require(:category_checklist_item).permit(:title, :state)
  end
end
