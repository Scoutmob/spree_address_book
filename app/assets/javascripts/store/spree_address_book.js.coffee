(($) ->

  $ ->
    if ($ ".select_address").length
      # hide address entry forms and disable all the fields (to avoid validation)
      ($ "[data-hook=billing_inner], [data-hook=shipping_inner]").hide().
        find('input, select').prop("disabled", true)

      if ($ 'input#order_use_billing').is(':checked') 
        ($ "#shipping .select_address").hide()

      # unbind the default use billing address handler and replace with one that
      # will show the save addresses
      ($ 'input#order_use_billing').unbind("click").click ->
        if ($ this).is(':checked')
          ($ "#shipping .select_address").hide()
          hide_address_form('shipping')
        else
          ($ "#shipping .select_address").show()
          if ($ "input[name='order[ship_address_id]']:checked").val() == '0'
            show_address_form('shipping')

      ($ "input[name='order[bill_address_id]']:radio").change ->
        if ($ "input[name='order[bill_address_id]']:checked").val() == '0'
          show_address_form('billing')
        else
          hide_address_form('billing')

      ($ "input[name='order[ship_address_id]']:radio").change ->
        if ($ "input[name='order[ship_address_id]']:checked").val() == '0'
          show_address_form('shipping')
        else
          hide_address_form('shipping')

  hide_address_form = (address_type) ->
    ($ "##{address_type}").
      find(".inner").hide().
      find("input, select").prop("disabled", true).
      end().end().
      trigger('spree_address_book:hide')

  show_address_form = (address_type) ->
    $addressFieldSet = ($ "##{address_type}")
    $addressFieldSet.
      find(".inner").show().
      find("input, select").prop("disabled", false)

    $stateField = $addressFieldSet.find("##{address_type[0]}state")
    if $stateField.find("select option").length
      $stateField.find('input').hide().prop 'disabled', true
    else
      $stateField.find("select").hide().prop 'disabled', true

    $addressFieldSet.trigger('spree_address_book:show')

)(jQuery)


