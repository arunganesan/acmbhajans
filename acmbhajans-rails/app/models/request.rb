class Request < ApplicationRecord
  belongs_to :person, optional: true
  belongs_to :satsang_request, class_name: :Bhajan, optional: true
  belongs_to :practice_request, class_name: :Bhajan, optional: true
end
