App.Materials = {

  Paginate: Backbone.View.extend({
    el: 'body',

    initialize: function(options){
      _.bindAll(this, "paginate");

      this.document   = $(document);
      this.windowProp = $(window);
      this.counter    = 1;
      this.multiplier = options.multiplier;
      this.limit      = options.limit;
      this.url        = options.url;
      this.windowProp.scroll(this.paginate);
    },

    paginate: function(){
      // So, the user reached the bottom of the page
      var self = this;
      if (this.currentScroll() > this.documentHeight() && this.counter < this.limit) {
        console.log(this.currentScroll());
        console.log(this.documentHeight());
        $.get(this.url + "?offset=" + (this.counter * this.multiplier), function(data){
          if (data != "") {
            self.$el.append(data).children(':last').hide().fadeIn(2000);
            self.postAction();
          }
        });
        this.counter = this.counter + 1;
      }
    },
    postAction:     function() {},
    documentHeight: function() { return this.document.height() - parseInt(this.document.height() * 0.1) },
    currentScroll:  function() { return this.windowProp.scrollTop() + this.windowProp.height() }

  
  }),

  Index: Backbone.View.extend({
    
    initialize: function(){
      _.bindAll(this);
      var xhr = new App.Materials.Paginate({ 
        el: $('section.list')[0],
        url: '/materials',
        limit: 5,
        multiplier: 6
      });
    }
  }),

  Explore: Backbone.View.extend({
    initialize: function(){
      _.bindAll(this);
      var xhr = new App.Materials.Paginate({
        el: $('section.content')[0],
        url: $('section.content').data('url'),
        limit: 65536,
        multiplier: 9
      });
    },
  }),

  Show: Backbone.View.extend({
    el: 'body',
    events: {
      "click li.indicator" : "activateIndicator"
    },

    initialize: function(){
      App.Common.initFacebook();
      this.indicators = this.$('li.indicator');
      this.showChildrenList(this.indicators.first());

    },
    
    activateIndicator: function(event){
      var klass = this.$(event.target);
      this.showChildrenList(klass);
    },

    showChildrenList: function(klass){
      var att  = klass.attr('data-type');
      this.$('ul.children').hide();
      this.$('li.indicator').removeClass('highlighted');
      this.$('li.indicator[data-type="'+att+'"]').addClass('highlighted');
      this.$('ul.children[data-type="'+att+'"]').fadeIn();
    }
  })
}
