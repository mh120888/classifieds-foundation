class AddPhotoToAdvertisements < ActiveRecord::Migration[5.0]
  def change
    add_column :advertisements, :photo, :string
  end
end
