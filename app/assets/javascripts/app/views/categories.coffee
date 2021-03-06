App.Categories ?= {}
App.Categories.Index = Backbone.View.extend
  el: 'body'
  events:
    'change #material_category_id' : 'showMaterialTypeSection'
    'click .white_box.box_title' : 'expandCheckboxes'

  initialize: ->
    _.bindAll(@)
    @showMaterialTypeSection()

  expandCheckboxes: (e)->
    e.preventDefault()
    jQuery(e.currentTarget).closest('.subcategorie_container').toggleClass 'expanded'

  showMaterialTypeSection: ->
    el = document.getElementById("material_category_id")
    selected = el[el.selectedIndex].innerText.toLowerCase()
    $('.checkboxes_container').hide()
    $("##{selected}_container").show()
    $('#parent_category').val(el.value)