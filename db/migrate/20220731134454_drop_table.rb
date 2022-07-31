class DropTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :medication_orders
    drop_table :inventories
    drop_table :donations
    drop_table :pharmacies
    drop_table :medications
  end
end
