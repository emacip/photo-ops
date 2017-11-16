require 'rails_helper'

RSpec.describe Photographer, type: :model do

  # Validation tests
  # ensure columns name is present before saving
  it { is_expected.to  validate_presence_of(:name) }
end
