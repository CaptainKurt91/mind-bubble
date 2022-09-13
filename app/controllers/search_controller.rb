class SearchController < ApplicationController
  def index
    PgSearch::Multisearch.rebuild(Category)
    PgSearch::Multisearch.rebuild(Task)
    @result = PgSearch.multisearch(params[:search][:query])

    if @result[0].searchable_type == "Category"
      redirect_to category_path(@result[0].searchable_id)
    elsif @result[0].searchable_type == "Task"
      redirect_to task_path(@result[0].searchable_id)
    end
    raise
  end
end
