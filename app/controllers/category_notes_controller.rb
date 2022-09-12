class CategoryNotesController < ApplicationController
  def new
    @category = Category.find(params[:category_id])
    @category_note = CategoryNote.new
  end

  def create
    @category = Category.find(params[:category_id])
    @category_note = CategoryNote.new(category_note_params)
    @category_note.category = @category
    # @category_note.user = current_user
    @category_note.save

    redirect_to category_path(@category)
  end

  def show
    @category_note = CategoryNote.find(params[:id])
  end

  private

  def category_note_params
    params.require(:category_note).permit(:name, :content)
  end
end
