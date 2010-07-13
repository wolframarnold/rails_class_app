# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  include AuthenticatedSystem
  # Scrub sensitive parameters from your log
  filter_parameter_logging :password

  rescue_from NameError, :with => :unknown_name_error

  private
  def unknown_name_error
    render :text => "Sorry you have a coding mistake."
  end
end
