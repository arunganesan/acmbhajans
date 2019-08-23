class Request < ApplicationRecord
  belongs_to :weekend
  belongs_to :person
  
  belongs_to :satsang_request, class_name: :Bhajan, optional: true
  belongs_to :practice_request, class_name: :Bhajan, optional: true
end
