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
    @category_checklist.save

    redirect_to category_path(@category)
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
    @checklist.update(name: params[:category_checklist][:name], end_date: params[:category_checklist][:end_date])
    @checklist.save
    redirect_to category_checklist_path(@checklist)
  end

  def destroy
    @checklist = CategoryChecklist.find(params[:id])
    @category = Category.find(@checklist[:category_id])
    @checklist.destroy
    redirect_to category_path(@category)
  end

  private

  def category_checklist_params
    params.require(:category_checklist).permit(:name, :end_date)
  end
end
