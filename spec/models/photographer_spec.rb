require 'rails_helper'

RSpec.describe Photographer, type: :model do
  # Association test
  # ensure Photographer model has a 1:N relationship with the Photo model
  it { is_expected.to  have_many(:photos) }

  # Validation tests
  # ensure columns name is present before saving
  it { is_expected.to  validate_presence_of(:name) }
end
