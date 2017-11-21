class Photo < ApplicationRecord
  belongs_to :photographer, foreign_key: 'photographer_id'

  # validations
  validates_presence_of :url, :code
  validates :image, attachment_presence: true
  has_attached_file :image, styles: { large: "2048x1152>", medium: "851x315>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: "image/jpg"
  validates_with AttachmentSizeValidator, attributes: :image, less_than: 2.megabytes
end
