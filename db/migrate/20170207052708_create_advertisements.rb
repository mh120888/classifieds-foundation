class CreateAdvertisements < ActiveRecord::Migration[5.0]
  def change
    create_table :advertisements do |t|
      t.string :title
      t.text :description
      t.string :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
