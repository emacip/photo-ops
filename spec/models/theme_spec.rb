# spec/models/theme_spec.rb
require 'rails_helper'

# Test suite for the Theme model
RSpec.describe Theme, type: :model do

  # Validation tests
  # ensure columns title is present before saving
  it { should validate_presence_of(:title) }
end
