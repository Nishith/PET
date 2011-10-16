# Controller created by the Rails framework from which all other controllers inherit.
class ApplicationController < ActionController::Base
  protect_from_forgery

  # Handles the exception the CanCan gem generates when an unauthorized access is attempted.
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end
end
