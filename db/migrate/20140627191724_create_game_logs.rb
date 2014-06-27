class CreateGameLogs < ActiveRecord::Migration
  def change
    create_table :game_logs do |t|
      t.belongs_to :game, index: true
      t.belongs_to :team, index: true
      t.belongs_to :quest, index: true
      t.string :action
      t.string :params

      t.timestamps
    end
  end
end
