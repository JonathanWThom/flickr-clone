class UpdatePhotos < ActiveRecord::Migration[5.0]
  def change
    remove_column :photos, :user_id
    add_column :photos, :owner_id, :integer
  end
end
