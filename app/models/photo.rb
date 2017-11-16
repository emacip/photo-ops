class Photo < ApplicationRecord
  belongs_to :photographer, foreign_key: 'photographer_id'

  # validations
  validates_presence_of :url, :code
end
