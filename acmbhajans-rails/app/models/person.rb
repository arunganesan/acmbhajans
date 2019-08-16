class Person < ApplicationRecord
  has_many ready, foreign_key: "bhajan_id", class_name: "Bhajan"
end
