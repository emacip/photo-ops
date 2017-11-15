# spec/models/stand_spec.rb
require 'rails_helper'

# Test suite for the Stand model
RSpec.describe Stand, type: :model do

  # Association test
  # ensure Stand model has a 1:1 relationship with the Theme model
  it { should have_one(:theme).with_foreign_key('theme_id') }

  # Validation tests
  # ensure column company_name is present before saving
  it { should validate_presence_of(:company_name) }
end