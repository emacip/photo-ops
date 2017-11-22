class AddRevokeToPhotos < ActiveRecord::Migration[5.1]
  def change
    add_column :photos, :revoke, :boolean, :default => false
  end
end
