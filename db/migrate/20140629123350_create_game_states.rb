class CreateGameStates < ActiveRecord::Migration
  def change
    create_table :game_states do |t|
      t.belongs_to :game, index: true
      t.belongs_to :team, index: true
      t.belongs_to :quest, index: true
      t.belongs_to :hint, index: true

      t.timestamps
    end
  end
end
