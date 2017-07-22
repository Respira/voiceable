class CreateRecordings < ActiveRecord::Migration[5.0]
  def change
    create_table :recordings do |t|

      t.references :user, foreign_key: true
      t.string :data, null: false 
      t.string :description 
      t.string :words_learned

      t.timestamps
    end
  end
end
