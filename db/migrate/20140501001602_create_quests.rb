class CreateQuests < ActiveRecord::Migration
  def change
    create_table :quests do |t|
      t.string :name
      t.belongs_to :game, index: true

      t.timestamps
    end
  end
end
