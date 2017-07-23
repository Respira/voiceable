class CreateRecordings < ActiveRecord::Migration[5.0]
  def change
    create_table :recordings do |t|

      t.references :user, foreign_key: true
      t.string :data, null: false 
      t.string :description 
      t.text :learning_words, array: true, default: []

      t.timestamps
    end
  end
end
