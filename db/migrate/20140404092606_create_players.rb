class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.text :bio
      t.string :nick
      t.belongs_to :user, index: true

      t.timestamps
    end
    add_index :players, :nick, unique: true
  end
end
