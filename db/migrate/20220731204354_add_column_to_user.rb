class AddColumnToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :institution, :string
    add_column :users, :observation, :text
  end
end
