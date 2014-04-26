class AddMaxAndMinNumberOfTeamsToGames < ActiveRecord::Migration
  def change
    add_column :games, :max_number_of_teams, :integer
    add_column :games, :min_number_of_teams, :integer
  end
end
