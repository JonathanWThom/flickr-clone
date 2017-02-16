class AddComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.column :content, :string
      t.column :photo_id, :integer
      t.column :owner_id, :integer
    end
  end
end
