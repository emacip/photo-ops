class AddImageFingerprintColumnToPhoto < ActiveRecord::Migration[5.1]
  def change
    add_column :photos, :image_fingerprint, :string
  end
end
