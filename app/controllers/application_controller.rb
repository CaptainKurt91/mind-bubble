class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :remember_page, only: [:index, :show]
  layout -> { "application" if turbo_frame_request? }

  private

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
