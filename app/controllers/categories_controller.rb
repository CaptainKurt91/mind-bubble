class CategoriesController < ApplicationController
  before_action :remember_page, only: [:index, :show]
  skip_before_action :authenticate_user!, only: %i[index]

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    if @category.title == "today"
      @sorted = Category.today_show(current_user)
    else
      @category_note = @category.category_notes.where("user_id = ?", current_user)
      @category_checklist = @category.category_checklists.where("user_id = ?", current_user)
      @category_task = @category.tasks.where("user_id = ?", current_user)
      @output = @category_note + @category_checklist + @category_task
      @sorted = @output.sort_by { |date| date.created_at }
    end
  end
end
