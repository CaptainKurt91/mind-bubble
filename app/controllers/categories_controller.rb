class CategoriesController < ApplicationController
  before_action :remember_page, only: [:index, :show]
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @category_note = @category.category_notes
    @category_checklist = @category.category_checklists
    @category_task = @category.tasks
    @output = @category_note + @category_checklist + @category_task
    @sorted = @output.sort_by { |date| date.created_at }
  end
end
