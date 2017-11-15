class Photo < ApplicationRecord
  has_one :photographer, foreign_key: 'photographer_id'

  # validations
  validates_presence_of :url, :code
end
