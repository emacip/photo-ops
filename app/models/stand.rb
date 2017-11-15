class Stand < ApplicationRecord
  # model association
  has_one :theme, foreign_key: 'theme_id'

  # validations
  validates_presence_of :company_name
end
