class WelcomeController < ApplicationController
  before_action :redirect_if_signed_in

  def index
    render layout: "welcome"
  end

  private

  def redirect_if_signed_in
    if user_signed_in?
      redirect_to games_path
    end
  end
end
