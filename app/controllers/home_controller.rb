# The Home Controller handles displaying the home page to the user.

class HomeController < ApplicationController
  # Handles the GET index request and redirects the user to the sign-in
  # page if he is not logged in.
  def index
    if !current_user
      redirect_to new_user_session_path
    end
  end
end
