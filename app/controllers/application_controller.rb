class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # faking current user to be the first user
  def current_user
    @currenr_user = User.first
  end
end
