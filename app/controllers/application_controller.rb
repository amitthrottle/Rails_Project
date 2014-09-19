class ApplicationController < ActionController::Base
  #rescue_from ActionController::RoutingError, :with => :render_not_found
  #rescue_from StandardError, :with => :render_server_error

  protect_from_forgery

  before_filter :authenticate_user! 
  rescue_from ActionController::RoutingError, with: :record_not_found
 
  private
 
    def record_not_found
      render plain: "404 Not Found", status: 404
    end

end
