class CreateDeities < ActiveRecord::Migration[5.1]
  def change
    create_table :deities do |t|
      t.string :name

      t.timestamps
    end
  end
end
