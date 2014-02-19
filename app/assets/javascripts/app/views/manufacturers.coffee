App.Manufacturers ?= {}
App.Manufacturers.Edit = Backbone.View.extend
  el: 'body'
  events:
    'change #manufacturer_has_postal_address' : 'togglePostalAddress'

  initialize: ->
    _.bindAll(@)

  togglePostalAddress: (e)->
    $checkbox = $(e.target).closest('.manufacturer_has_postal_address').find('.custom.checkbox')
    $postalAddress = $("#postal_address")
    if $checkbox.hasClass "checked"
      $postalAddress.addClass("inactive")
    else
      $postalAddress.removeClass("inactive")