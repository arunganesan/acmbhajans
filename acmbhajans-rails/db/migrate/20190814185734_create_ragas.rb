class CreateRagas < ActiveRecord::Migration[5.1]
  def change
    create_table :ragas do |t|
      t.string :name
      t.string :arohanam
      t.string :avarohanam
      t.string :anyasvara

      t.timestamps
    end
  end
end
