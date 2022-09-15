class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_calendar_items
  before_action :remember_page, only: [:index, :show]
  layout -> { "application" if turbo_frame_request? }

  private

  def set_calendar_items
    # Scope your query to the dates being shown:
    start_date = params.fetch(:start_date, Date.today).to_date
    date_range = start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week
    categories_checklist = CategoryChecklist.where(end_date: date_range).to_a
    categories_notes = CategoryNote.where(end_date: date_range).to_a
    tasks_checklist = TaskChecklist.where(end_date: date_range).to_a
    tasks_notes = TaskNote.where(end_date: date_range).to_a
    @calendar_items = categories_checklist + categories_notes + tasks_checklist + tasks_notes
  end

  def remember_page
    if params[:is_back]
      session[:previous_pages].pop
    else
      session[:previous_pages] ||= []
      session[:previous_pages] << url_for(params.to_unsafe_h) if request.get?
      session[:previous_pages]
    end
  end
end
