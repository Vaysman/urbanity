class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :points
      t.belongs_to :quest
      t.string :text

      t.timestamps
    end
    add_index :answers, :quest_id
  end
end
