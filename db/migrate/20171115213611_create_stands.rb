class CreateStands < ActiveRecord::Migration[5.1]
  def change
    create_table :stands do |t|
      t.string :company_name
      t.references :theme, foreign_key: true

      t.timestamps
    end
  end
end
