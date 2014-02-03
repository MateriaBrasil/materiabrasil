App.Materials ?= {}
App.Modules ?= {}
App.Materials.Edit_attachments = Backbone.View.extend
  el: 'body'
  # events:
  #   'change #material_category_id' : 'showMaterialTypeSection'
  #   'click .white_box.box_title' : 'expandCheckboxes'

  initialize: ->
    _.bindAll(@)
    if window.File && window.FileReader && window.FileList && window.Blob
      @prepareToDropzone()
      @uploaders = []
      for uploader in $('.upload-image')
        @uploaders.push new App.Modules.DragDropUploader { el: uploader }

  prepareToDropzone: ->
    @el.insertAdjacentHTML 'beforeend', '<div id="dropzone-preview-image"></div>'
    @$('input.fallback[type=file]').closest('.input.file').remove()

App.Modules.DragDropUploader = Backbone.View.extend
  # TODO: Uploader functionality
  initialize: ->
    _.bindAll this, 'onFileAdded', 'onUploadProgress', 'onUploadComplete', 'onUploadFail'
    @action_url = @$el.closest('form')[0].getAttribute("action")
    @param_name = @$el[0].dataset.param
    @$image_previewer = @$('.uploaded-image')
    @initializeDropzone()
    @listenDropzoneEvents()

  initializeDropzone: ->
    @dropzone = new Dropzone(@el,
      url: @action_url
      acceptedFiles: "image/*"
      headers: "X-CSRF-Token" : $('meta[name="csrf-token"]')[0].getAttribute 'content'
      paramName: "user[#{@param_name}]"
      method: 'PUT'
      uploadMultiple: false
      previewsContainer: '#dropzone-preview-image'
    )

  listenDropzoneEvents: ->
    if @dropzone?
      @dropzone.on "addedfile", @onFileAdded
      @dropzone.on "uploadprogress", @onUploadProgress
      @dropzone.on "success", @onUploadComplete
      @dropzone.on "error", @onUploadFail

  onFileAdded: (file)->
    @$('.info').text 'Drop an image here'
    @$el.removeClass('upload-complete upload-fail').addClass 'upload-started'

  onUploadProgress: (file, progress)->
    @$('.info').text 'Drop an image here'

  onUploadComplete: (file, response)->
    @$('.info').text 'Drop an image here'
    @$el.removeClass('upload-started').addClass 'upload-complete'
    @$image_previewer.attr 'src', response[@param_name]

  onUploadFail: (file, error)->
    @$('.info').text error
    @$el.removeClass('upload-started').addClass 'upload-fail'

  # openFileChooser: (e)->
  #   @$el.trigger 'click'