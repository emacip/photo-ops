class Photo < ApplicationRecord
  before_create :generate_code

  belongs_to :photographer, foreign_key: 'photographer_id'

  # validations
  validates_presence_of :url
  #validates_inclusion_of :revoke, :in => [true, false]
  validates :image, attachment_presence: true
  has_attached_file :image, styles: { large: "2048x1152>", medium: "851x315>" },
                    default_url: "/images/:style/missing.png",
                    adapter_options: { hash_digest: Digest::SHA256 }
  validates_attachment_content_type :image, content_type: "image/jpg"
  validates_with AttachmentSizeValidator, attributes: :image, less_than: 2.megabytes

  scope :not_revoked,   -> { where(revoke: false) }

  private

  def generate_code
    self.code = rand(36**8).to_s(36)
  end

end
