class GamesController < ApplicationController
  include CurrentPlayer

  decorates_assigned :game

  before_action :authenticate_user!
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  def index
    @games = current_player.games
    @games = @games.where(player: current_user) if params[:filter] == "my"
  end

  # GET /games/1
  def show
  end

  # GET /games/new
  def new
    @game = Game.new(max_number_of_teams: 15, min_number_of_teams: 3)
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  def create
    @game = current_player.games.build(game_params)

    if @game.save
      redirect_to @game, notice: 'Game was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /games/1
  def update
    if @game.update(game_params)
      redirect_to @game, notice: 'Game was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /games/1
  def destroy
    @game.destroy
    redirect_to games_url, notice: 'Game was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_game
    @game = current_player.games.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def game_params
    params.require(:game).permit(:name, :start, :registration_end, :max_number_of_teams, :min_number_of_teams)
  end
end
