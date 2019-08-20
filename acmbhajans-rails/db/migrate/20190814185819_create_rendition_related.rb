class CreateRenditionRelated < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
    end

    create_table :renditions do |t|
      t.date :date
      t.references :lead, foreign_key: true
      t.references :bhajan, foreign_key: true
      t.references :order, foreign_key: true
      t.references :event, foreign_key: true
      t.references :sound_system, foreign_key: true
    end
  end
end
