class CreateRenditionRelated < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
    end

    create_table :renditions do |t|
      t.date :date
      t.integer :order  # 0 is practice sure
      t.string :recording_url 
      t.string :shruti

      # references
      t.references :bhajan, foreign_key: true
      t.references :event, foreign_key: true

      # many-many relationships not listed here
      # they have their own join table
      # lead - group of people
      # backup - ''
      # instrumentalists
      # sound system 
    end
  end
end
