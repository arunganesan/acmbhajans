class Request < ApplicationRecord
  belongs_to :practice_request, :class_name => "Bhajan"
  belongs_to :satsang_request, :class_name => "Bhajan"
end
