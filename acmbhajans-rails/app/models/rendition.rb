class Rendition < ApplicationRecord
  belongs_to :bhajan
  belongs_to :event
  belongs_to :weekend

  has_and_belongs_to_many :lead, :class_name => "Person", :join_table => "lead_rendition", :association_foreign_key => "lead_id", :foreign_key => "rendition_as_lead_id"
  has_and_belongs_to_many :backup, :class_name => "Person", :join_table => "backup_rendition", :association_foreign_key => "backup_id", :foreign_key => "rendition_as_backup_id"
  has_and_belongs_to_many :instrumentalists, :class_name => "Person", :join_table => "instrumentalist_rendition", :association_foreign_key => "instrumentalist_id", :foreign_key => "rendition_as_instrumentalist_id"
  has_and_belongs_to_many :soundsystem, :class_name => "Person", :join_table => "soundsystem_rendition", :association_foreign_key => "soundsystem_id", :foreign_key => "rendition_as_soundsystem_id"
end
