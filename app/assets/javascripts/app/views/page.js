var Router = Backbone.Router.extend({
  routes : {
    'i/:param' : 'showPageBlock' 
  },

  showPageBlock: function(param){
    this.showChosenBlock(param);
  },

  showChosenBlock: function(block){
    $('.about section.row').hide().addClass('inactive');
    $('section.'+ block).fadeIn().removeClass('inactive').addClass('active');
  }

});

App.Pages = {

  About: Backbone.View.extend({
    el: 'body',
    events: {
      'click nav a' : 'addActiveClass',
      'click .lifecycle img' : 'showCycle'
    },

    initialize: function(){
      _.bindAll(this);
      new Router();
      Backbone.history.start();
      App.Common.initFacebook();
    },

    showCycle: function(event){
      var obj = $(event.target);
      this.$('.lifecycle ul.children li').removeClass('active').fadeOut().addClass('inactive').stop();
      this.$('.lifecycle ol li').removeClass('active');
      obj.parent('li').removeClass('inactive');
      this.$('ul.children li.'+obj.attr('data-type')).removeClass('inactive').fadeIn().addClass('active').stop();
      obj.parent('li').addClass('active');
    },

    addActiveClass: function(event){
      var that = $(event.target);
      this.$('nav a').removeClass('active');
      that.addClass('active');
    }

  })

}
