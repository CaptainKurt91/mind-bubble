class CategoryNotesController < ApplicationController
  def new
    @category = Category.find(params[:category_id])
    @category_note = CategoryNote.new
  end

  def create
    @category = Category.find(params[:category_id])
    @category_note = CategoryNote.new(category_note_params)
    @category_note.category = @category
    @category_note.save

    redirect_to category_path(@category)
  end

  def show
    @category_note = CategoryNote.find(params[:id])
  end

  def edit
    @note = CategoryNote.find(params[:id])
  end

  def update
    @note = CategoryNote.find(params[:id])
    @note.update(name: params[:category_note][:name], content:  params[:category_note][:content], end_date: params[:category_note][:end_date])
    @note.save
    redirect_to category_note_path(@note)
  end

  def destroy
    @note = CategoryNote.find(params[:id])
    @category = Category.find(@note[:category_id])
    @note.destroy
    redirect_to category_path(@category)
  end


  private

  def category_note_params
    params.require(:category_note).permit(:name, :content)
  end
end
