class DropTeamMembersTable < ActiveRecord::Migration
  def up
    drop_table :team_members do |t|
      t.belongs_to :player
      t.belongs_to :team

      t.timestamps
    end
  end
end
