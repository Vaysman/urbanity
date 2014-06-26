class CreateHints < ActiveRecord::Migration
  def change
    create_table :hints do |t|
      t.text :text
      t.integer :delay
      t.belongs_to :quest, index: true
      t.integer :position

      t.timestamps
    end
  end
end
