class Rendition < ApplicationRecord
  belongs_to :lead
  belongs_to :bhajan
  belongs_to :order
  belongs_to :event
  belongs_to :sound_system


  has_many instrumentalists, foreign_key: "person_id", class_name: "Person"
  has_many backup, foreign_key: "person_id", class_name: "Person"
  has_one sound_system, class_name => "Person"
  has_one lead, class_name => "Person"
end
