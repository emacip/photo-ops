require 'rails_helper'

RSpec.describe Photo, type: :model do

  # Association test
  # ensure Photo model has a 1:1 relationship with the Photographer model
  it { should have_one(:photographer).with_foreign_key('photographer_id') }

  # Validation tests
  # ensure column url and code are present before saving
  it { should validate_presence_of(:url) }
  it { should validate_presence_of(:code) }
end
