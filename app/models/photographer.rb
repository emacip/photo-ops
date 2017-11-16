class Photographer < ApplicationRecord
  has_many :photos

  # validations
  validates_presence_of :name
end
