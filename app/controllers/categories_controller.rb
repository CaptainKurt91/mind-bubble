class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @tasks = @category.tasks
  end

  private

  def category_params
    params.require(:vehicle).permit(:name)
  end
end
