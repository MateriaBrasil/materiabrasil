App.Manufacturers ?= {}
App.Manufacturers.Edit = Backbone.View.extend
  el: 'body'
  events:
    'change #manufacturer_has_postal_address' : 'togglePostalAddress'
    'click .contact_container .remove_fields' : 'removeClickedContact'
    'click .form-inputs .add_fields' : 'addNewContact'

  initialize: ->
    _.bindAll(@)

  togglePostalAddress: (e)->
    $checkbox = $(e.target).closest('.manufacturer_has_postal_address').find('.custom.checkbox')
    $postalAddress = $("#postal_address")
    if $checkbox.hasClass "checked"
      $postalAddress.addClass("inactive")
    else
      $postalAddress.removeClass("inactive")

  removeClickedContact: (e)->
    e.preventDefault()
    $container = $(e.target).closest '.contact_container'
    $container.find('input[required=required]').val 'xxx@xxx.xx'
    $(e.target).prev('input[type=hidden]').val '1'
    $container.hide()

  addNewContact: (e)->
    e.preventDefault()
    $target = $(e.target)
    time = new Date().getTime()
    regexp = new RegExp $target.data('id'), 'g'
    $target.parent().before $target.data('fields').replace(regexp, time)
