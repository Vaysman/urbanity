module CurrentPlayer
  extend ActiveSupport::Concern

  included do
    before_filter :set_player
    helper_method :current_player
  end

  def current_player
    @current_player
  end

  def set_player
    fail SecurityError.new("User is not logged in") unless user_signed_in?
    @current_player ||= current_user.player
  end
end