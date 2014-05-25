class AddPositionToQuests < ActiveRecord::Migration
  def change
    add_column :quests, :position, :integer
  end
end
