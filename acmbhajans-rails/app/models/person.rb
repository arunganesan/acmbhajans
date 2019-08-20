class Person < ApplicationRecord
  #has_many :ready_bhajans, foreign_key: "ready_id", class_name: "Bhajan"
  has_and_belongs_to_many :ready_list, :class_name => "Bhajan", :join_table => "people_ready_list", :association_foreign_key => "ready_list_id", :foreign_key => "people_id"
end
