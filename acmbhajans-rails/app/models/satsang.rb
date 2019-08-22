class Satsang < ApplicationRecord
  belongs_to :practice_request, :class_name => "Bhajan"
  belongs_to :satsang_request, :class_name => "Bhajan"
  belongs_to :practice_bhajan, :class_name => "Rendition"
  belongs_to :satsang_bhajan, :class_name => "Rendition"
end
