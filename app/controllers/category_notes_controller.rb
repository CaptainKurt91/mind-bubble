class CategoryNotesController < ApplicationController
  before_action :remember_page, only: [:index, :show]

  def new
    @category = Category.find(params[:category_id])
    @category_note = CategoryNote.new
  end

  def create
    @category = Category.find(params[:category_id])
    @category_note = CategoryNote.new(category_note_params)
    @category_note.category = @category
    @category_note.user = current_user
    if @category_note.save
      redirect_to category_path(@category)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @note = CategoryNote.find(params[:id])
  end

  def edit
    @note = CategoryNote.find(params[:id])
  end

  def update
    @note = CategoryNote.find(params[:id])
    if @note.update(category_note_params)
      redirect_to category_note_path(@note)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @note = CategoryNote.find(params[:id])
    @category = Category.find(@note[:category_id])
    @note.destroy
    redirect_to category_path(@category)
  end

  private

  def category_note_params
    params.require(:category_note).permit(:title, :content, :end_date)
  end
end
