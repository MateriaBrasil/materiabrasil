App.Categories ?= {}
App.Categories.Index = Backbone.View.extend
  el: 'body'
  events:
    'change #material_type_selection' : 'showMaterialTypeSection',

  initialize: ->
    _.bindAll(@)
    @showMaterialTypeSection()

  showMaterialTypeSection: ->
    el = document.getElementById("material_type_selection")
    selected = el[el.selectedIndex].innerText.toLowerCase()
    $('.checkboxes_container').hide()
    $("##{selected}_container").show()
    $('#parent_category').val(el.value)