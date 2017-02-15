class AddPhotosAndTags < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    
    create_table :photos do |t|
      t.column :user_id, :integer
    end

    create_table :tags do |t|
      t.column :photo_id, :integer
      t.column :user_id, :integer
    end
  end
end
