class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    games_path
  end

  protected

  def set_player
    fail SecurityError.new("User is not logged in") unless user_signed_in?
    @player ||= current_user.player
  end
end
