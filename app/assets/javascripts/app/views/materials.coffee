App.Materials ?= {}
App.Materials.Edit_attachments = Backbone.View.extend
  el: 'body'
  events:
    'change input.file' : 'submitForm'
    'click .uploaded-attachment .edit-name-link' : 'toggleAttachmentInput'

  initialize: ->
    _.bindAll(@)
    @$el.prepend("<div id='loading'/>")
    $imageInput = $(".img-upload")
    $fileInput = $(".attachment-upload")
    @form = $imageInput.closest('form')
    @form.find('.image-fields').prepend($imageInput)
    @form.find('.attachment-fields').prepend($fileInput)

  submitForm: (e)->
    pattern = null
    if $(e.target).closest('.img-upload').length > 0
      pattern = /\.(jpg|png|gif)$/
    else if $(e.target).closest('.attachment-upload').length > 0
      pattern = /\.(pdf|doc|docx|jpg|png|xls|xlsx)$/
      @setBlankName(e.target)
    if @validateFile(e.target.value, pattern)
      $("#loading").addClass "active"
      @form.find('#sent_thru_javascript').val true
      @form.submit()

  validateFile: (value, pattern)->
    valid = value.match pattern
    if valid? then valid = true else valid = false
    valid

  setBlankName: (target)->
    $wrapper = $(target).closest('.attachment-upload')
    index = $wrapper.data 'index'
    nameField = $wrapper.find "#material_attachments_attributes_#{index}_name"
    nameField.val("Anexo #{index+1}") if nameField[0].value == ""

  toggleAttachmentInput: (e)->
    e.preventDefault()
    $(e.currentTarget).closest('.uploaded-attachment').toggleClass 'editing'