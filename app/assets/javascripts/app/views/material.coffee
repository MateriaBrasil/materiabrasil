App.Materials =
  Paginate: Backbone.View.extend(
    el: "body"
    initialize: (options) ->
      _.bindAll this, "paginate"
      @document = $(document)
      @windowProp = $(window)
      @counter = 1
      @multiplier = options.multiplier
      @limit = options.limit
      @url = options.url
      @windowProp.scroll @paginate

    paginate: ->
      
      # So, the user reached the bottom of the page
      @getListOfObjects()  if @currentScroll() > @documentHeight() and @counter < @limit

    postAction: ->

    getListOfObjects: ->
      self = this
      $.get @url + "?offset=" + (@counter * @multiplier), (data) ->
        unless data is ""
          self.$el.append(data).children(":last").hide().fadeIn 2000
          self.postAction()

      @counter = @counter + 1

    documentHeight: ->
      @document.height() - parseInt(@document.height() * 0.1)

    currentScroll: ->
      @windowProp.scrollTop() + @windowProp.height()
  )
  Index: Backbone.View.extend(initialize: ->
    _.bindAll this
  )
  
  # var xhr = new App.Materials.Paginate({ 
  #   el: $('section.list')[0],
  #   url: '/materials',
  #   limit: 5,
  #   multiplier: 6
  # });
  Explore: Backbone.View.extend(initialize: ->
    _.bindAll this
    xhr = new App.Materials.Paginate(
      el: $("section.content")[0]
      url: $("section.content").data("url")
      limit: 65536
      multiplier: 9
    )
  )
  Show: Backbone.View.extend(
    el: "body"
    events:
      "click li.indicator": "activateIndicator"
      "change .manufacturer_contact": "showManufacturerContact"

    initialize: ->
      App.Common.initFacebook()
      _.bindAll this, 'showManufacturerContact', 'activateIndicator', 'showChildrenList', 'detectKeyUp', 'resizedWindow'
      
      @indicators = @$("li.indicator")
      @showChildrenList @indicators.first()
      galleryChildren = $('.image-slider .slide-image').length
      if galleryChildren > 1
        @gallery = new App.GalleryView { model: new App.GalleryModel { children: galleryChildren } }
        $(window).on 'keyup', @detectKeyUp
        $(window).on 'resize', @resizedWindow
        $(window).trigger 'resize'

    showManufacturerContact: (e) ->
      $(".contact-info").hide()
      $(".contact-info#contact_" + e.target.value).show()

    activateIndicator: (event) ->
      klass = @$(event.target)
      @showChildrenList klass

    showChildrenList: (klass) ->
      att = klass.attr("data-type")
      @$("ul.children").hide()
      @$("li.indicator").removeClass "highlighted"
      @$("li.indicator[data-type=\"" + att + "\"]").addClass "highlighted"
      @$("ul.children[data-type=\"" + att + "\"]").fadeIn()

    detectKeyUp: (e)->
      if e.keyCode == 39 or e.keyCode == 37
        @gallery.model.keyPressed e.keyCode

    resizedWindow: (e)->
      @gallery.model.setChildrenWidth @$('.image-slider .slide-image').width()
  )

App.Materials.Search = App.Materials.Explore.extend()

######################################
# CODE FOR THE GALLERIES
######################################
App.GalleryView = Backbone.View.extend
  el: '.image-slider'
  events:
    'click .slide-image': 'setCurrentImage'

  initialize: ->
    _.bindAll this, 'render'
    @model.on 'change:current change:childrenWidth', @render, @
    @render()

  render: ->
    @$el.css 'text-indent', -(@model.get('current') * (@$('.slide-image').width()+4))

  setCurrentImage: (e)->
    @model.nextImage()

App.GalleryModel = Backbone.Model.extend
  defaults:
    current: 0
    children: 1
    gut: 4

  keyPressed: (keyCode)->
    @nextImage() if keyCode == 39
    @prevImage() if keyCode == 37

  nextImage: ->
    @set 'current', @endlessArray(@get('current')+1)

  prevImage: ->
    @set 'current', @endlessArray(@get('current')-1)

  endlessArray: (n)->
    # ADJUSTS NUMBER ACCORDING TO GALLERY CHILDREN'S LENGHT, MAKING A LOOP IN THE ARRAY
    if n < 0 then @get('children')-1 else if n > @get('children')-1 then 0 else n

  setChildrenWidth: (n)->
    @set 'childrenWidth', n + @get('gut')