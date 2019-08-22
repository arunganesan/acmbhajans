class Satsang < ApplicationRecord
  belongs_to :practice_request, class_name => "Bhajan"
  belongs_to :satsang_request, class_name => "Bhajan"
  belongs_to :practice_bhajan, class_name => "Rendition"
  belongs_to :satsang_bhajan, class_name => "Rendition"
  
	# has_one practice_request, class_name => "Bhajan"
	# has_one satsang_request, class_name => "Bhajan"
	# has_one practice_bhajan, class_name => "Rendition"
	# has_one satsang_bhajan, class_name => "Rendition"
end
