class RenamePlayerIdToCreatorIdInGames < ActiveRecord::Migration
  def change
    rename_column :games, :player_id, :creator_id
  end
end
