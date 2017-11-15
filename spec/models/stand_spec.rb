# spec/models/stand_spec.rb
require 'rails_helper'

# Test suite for the Stand model
RSpec.describe Stand, type: :model do

  # Association test
  # ensure an theme record belongs to a single stand record
  it { should have_one(:theme).with_foreign_key('theme_id') }

  # Validation tests
  # ensure column company_name is present before saving
  it { should validate_presence_of(:company_name) }
end