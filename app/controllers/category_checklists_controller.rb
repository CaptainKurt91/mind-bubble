class CategoryChecklistsController < ApplicationController
  before_action :remember_page, only: [:index, :show]

  def new
    @category = Category.find(params[:category_id])
    @category_checklist = CategoryChecklist.new
  end

  def create
    @category = Category.find(params[:category_id])
    @category_checklist = CategoryChecklist.new(category_checklist_params)
    @category_checklist.category = @category
    @category_checklist.user = current_user
    if @category_checklist.save
      redirect_to category_path(@category)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @checklist = CategoryChecklist.find(params[:id])
    @items = @checklist.category_checklist_items
    @name = "category"
  end

  def edit
    @checklist = CategoryChecklist.find(params[:id])
  end

  def update
    @checklist = CategoryChecklist.find(params[:id])
    if @checklist.update(category_checklist_params)
      redirect_to category_checklist_path(@checklist)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @checklist = CategoryChecklist.find(params[:id])
    @category = Category.find(@checklist[:category_id])
    @checklist.destroy
    redirect_to category_path(@category)
  end

  private

  def category_checklist_params
    params.require(:category_checklist).permit(:title, :end_date)
  end
end
