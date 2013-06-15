(($) ->

  $ ->
    if ($ ".select_address").length
      ($ 'input#order_use_billing').unbind("click")
      ($ "[data-hook=billing_inner], [data-hook=shipping_inner]").hide().find('input, select').prop("disabled", true)

      if ($ 'input#order_use_billing').is(':checked') 
        ($ "#shipping .select_address").hide()
      
      ($ 'input#order_use_billing').click ->
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
    $("##{address_type} .inner").hide()
    $("##{address_type} .inner input").prop("disabled", true)
    $("##{address_type} .inner select").prop("disabled", true)
  
  show_address_form = (address_type) ->
    $("##{address_type} .inner").show()
    $("##{address_type} .inner input").prop("disabled", false)
    $("##{address_type} .inner select").prop("disabled", false)

)(jQuery)


