class PlayersController < ApplicationController
  include CurrentPlayer

  decorates_assigned :player

  def show
  end

  def edit
  end

  def update
    if @player.update(player_params)
      redirect_to player_path, notice: 'Player was successfully updated.'
    else
      render :edit
    end
  end

  private

  # Only allow a trusted parameter "white list" through.
  def player_params
    params.require("player").permit("first_name", "last_name", "bio")
  end

end
