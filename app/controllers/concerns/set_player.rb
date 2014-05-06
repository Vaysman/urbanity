module SetPlayer
  extend ActiveSupport::Concern

  included do
    before_action :set_player
  end

  def set_player
    fail SecurityError.new("User is not logged in") unless user_signed_in?
    @player ||= current_user.player
  end
end