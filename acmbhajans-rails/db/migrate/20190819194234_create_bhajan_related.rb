class CreateBhajanRelated < ActiveRecord::Migration[5.1]
  def change
    create_table :deities do |t|
      t.string :name
    end

    create_table :languages do |t|
      t.string :name
    end


    create_table :ragas do |t|
      t.string :name
      t.string :arohanam
      t.string :avarohanam
      t.string :anyasvara
    end


    create_table :bhajans do |t|
      t.string :name
      t.string :beat
      t.integer :speed
      
      t.references :deity
      t.references :raga
      t.references :language
    end
  end
end
