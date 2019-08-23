class Bhajan < ApplicationRecord
  belongs_to :raga, optional: true
  belongs_to :deities, optional: true
  belongs_to :languages, optional: true

  has_many :requests, foreign_key: :practice_request_id
  has_many :requests, foreign_key: :satsang_request_id

  has_and_belongs_to_many :people_ready_list, :class_name => "Person", :join_table => "people_ready_list", :association_foreign_key => "people_id", :foreign_key => "ready_list_id"
end
