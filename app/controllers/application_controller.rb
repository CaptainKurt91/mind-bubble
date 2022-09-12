class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  layout -> { "application" if turbo_frame_request? }

  
end
