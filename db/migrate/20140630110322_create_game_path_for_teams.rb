class CreateGamePathForTeams < ActiveRecord::Migration
  def change
    create_table :game_path_for_teams do |t|
      t.belongs_to :game, index: true
      t.belongs_to :team, index: true
      t.belongs_to :quest, index: true
      t.integer :position

      t.timestamps
    end
  end
end
