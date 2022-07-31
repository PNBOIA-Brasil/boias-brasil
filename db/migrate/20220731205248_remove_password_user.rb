class RemovePasswordUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :link1, :text
    add_column :users, :link2, :text
    add_column :users, :link3, :text
    add_column :users, :result, :boolean, default: :false
  end
end
