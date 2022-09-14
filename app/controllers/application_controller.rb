class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  layout -> { "application" if turbo_frame_request? }

  private

  def remember_page
    session[:previous_pages] ||= []
    session[:previous_pages] << url_for(params.to_unsafe_h) if request.get?
    session[:previous_pages] = session[:previous_pages].uniq.first(2)
  end
end
