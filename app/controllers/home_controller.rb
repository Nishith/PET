# The Home Controller handles displaying the home page to the user.

class HomeController < ApplicationController
  # Handles the GET index request and redirects the user to the sign-in
  # page if he is not logged in.
  def index
    if !current_user
      redirect_to new_user_session_path
    else
      if current_user.role? "developer"
        redirect_to effort_logs_path
      else
        @recent_projects = ProjectPhaseDeliverable.recently_logged.group_by(&:project)
        respond_to do |format|
          format.html # index.html.erb
          format.xml  { render :xml => @recent_projects }
        end
      end
    end
  end
end
