class CreateBhajans < ActiveRecord::Migration[5.1]
  def change
    create_table :bhajans do |t|
      t.string :name
      t.string :deity
      t.references :raga, foreign_key: true
      t.string :beat
      t.integer :speed
      t.string :language

      t.timestamps
    end
  end
end
