class PlayersController < ApplicationController
  before_action :authenticate_user!  

  include CurrentPlayer

  before_action do
    @player = current_player
  end

  decorates_assigned :player

  def show
  end

  def edit
  end

  def update
    if player.update(player_params)
      redirect_to player_path, notice: 'Player was successfully updated.'
    else
      render :edit
    end
  end

  private

  def player_params
    params.require("player").permit("first_name", "last_name", "bio")
  end
end
