class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @category_note = @category.category_notes
    @category_checklist = @category.category_checklists
    @output = @category_note + @category_checklist
    @sorted = @output.sort_by { |date| date.created_at }
  end
end
