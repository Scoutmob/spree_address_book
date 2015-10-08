class AddIndexesToAddressKeys < ActiveRecord::Migration
  def change
    add_index :spree_orders, :bill_address_id
    add_index :spree_orders, :ship_address_id
    add_index :spree_shipments, :address_id
  end
end
