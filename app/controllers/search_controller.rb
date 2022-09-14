class SearchController < ApplicationController
  def index
    PgSearch::Multisearch.rebuild(Category)
    PgSearch::Multisearch.rebuild(CategoryChecklist)
    PgSearch::Multisearch.rebuild(CategoryNote)
    PgSearch::Multisearch.rebuild(Task)
    PgSearch::Multisearch.rebuild(TaskChecklist)
    PgSearch::Multisearch.rebuild(TaskNote)

    @result = PgSearch.multisearch(params[:search][:query])

    return if @result[0].searchable_type.nil?

    if @result[0].searchable_type == "Category"
      redirect_to category_path(@result[0].searchable_id)
    elsif @result[0].searchable_type == "CategoryNote"
      redirect_to category_note_path(@result[0].searchable_id)
    elsif @result[0].searchable_type == "CategoryChecklist"
      redirect_to category_checklist_path(@result[0].searchable_id)
    elsif @result[0].searchable_type == "Task"
      redirect_to task_path(@result[0].searchable_id)
    elsif @result[0].searchable_type == "TaskNote"
      redirect_to task_note_path(@result[0].searchable_id)
    elsif @result[0].searchable_type == "TaskChecklist"
      redirect_to task_checklist_path(@result[0].searchable_id)
    end
  end
end
