class Person < ApplicationRecord
  #has_many :ready_bhajans, foreign_key: "ready_id", class_name: "Bhajan"
  has_and_belongs_to_many :ready_list, :class_name => "Bhajan", :join_table => "people_ready_list", :association_foreign_key => "ready_list_id", :foreign_key => "people_id"


  has_and_belongs_to_many :rendition_as_lead, :class_name => "Rendition", :join_table => "lead_rendition", :association_foreign_key => "rendition_as_lead_id", :foreign_key => "lead_id"
  has_and_belongs_to_many :rendition_as_backup, :class_name => "Rendition", :join_table => "backup_rendition", :association_foreign_key => "rendition_as_backup_id", :foreign_key => "backup_id"
  has_and_belongs_to_many :rendition_as_instrumentalist, :class_name => "Rendition", :join_table => "instrumentalist_rendition", :association_foreign_key => "rendition_as_instrumentalist_id", :foreign_key => "instrumentalist_id"
  has_and_belongs_to_many :rendition_as_soundsystem, :class_name => "Rendition", :join_table => "soundsystem_rendition", :association_foreign_key => "rendition_as_soundsystem_id", :foreign_key => "soundsystem_id"
end
