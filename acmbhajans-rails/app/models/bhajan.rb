class Bhajan < ApplicationRecord
  belongs_to :raga, optional: true
  belongs_to :deities, optional: true
  belongs_to :languages, optional: true
end
