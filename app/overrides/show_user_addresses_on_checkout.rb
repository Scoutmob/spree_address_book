Deface::Override.new(
  :virtual_path => "spree/checkout/_address",
  :name => "show_user_addresses_on_bill_address",
  :insert_before => %q{[data-hook=billing_fieldset_wrapper] code[erb-loud]:contains("render :partial => 'spree/address/form'")},
  :text => "<%= render :partial => 'spree/checkout/user_addresses', :locals => {:address_type => 'billing', :form => form, :address_name => 'bill_address'} %>",
  :disabled => false
)

Deface::Override.new(
  :virtual_path => "spree/checkout/_address",
  :name => "show_user_addresses_on_ship_address",
  :insert_before => %q{[data-hook=shipping_fieldset_wrapper] code[erb-loud]:contains("render :partial => 'spree/address/form'")},
  :text => "<%= render :partial => 'spree/checkout/user_addresses', :locals => {:address_type => 'shipping', :form => form, :address_name => 'ship_address'} %>",
  :disabled => false
)