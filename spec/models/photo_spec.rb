require 'rails_helper'

RSpec.describe Photo, type: :model do

  # Association test
  # ensure Photo model has a 1:1 relationship with the Photographer model
  it { is_expected.to  belong_to(:photographer).with_foreign_key('photographer_id') }

  # Validation tests
  # ensure column url and code are present before saving
  it { is_expected.to  validate_presence_of(:url) }
  it { is_expected.to  have_attached_file(:image) }
  it { is_expected.to  validate_attachment_presence(:image) }
  it { is_expected.to  validate_attachment_content_type(:image).
      allowing('image/jpg') }
  it { is_expected.to  validate_attachment_size(:image).less_than(2.megabytes) }
end
