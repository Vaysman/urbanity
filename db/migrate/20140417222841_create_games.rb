class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.timestamp :start
      t.timestamp :registration_end
      t.belongs_to :player

      t.timestamps
    end
    add_index :games, :start
    add_index :games, :registration_end
    add_index :games, :name
  end
end
