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

  Portfolio: Backbone.View.extend({
    el: 'body',
    events: {
      'click .thumb_image' : 'activateItem',
      'click nav.sub_menu a' : 'activateSection'
    },

    initialize: function(){
      _.bindAll(this);
      new Router();
      Backbone.history.start();
      this.$portfolio_section = $('.portfolio_section');
      this.$thumb_links = $('.thumb_links', this.$portfolio_section);
      this.initializeAllFirstItems();
    },

    activateSection: function(e){
      e.preventDefault();
      $target = $(e.target);
      $('a', $target.closest('.sub_menu')).removeClass('active');
      $target.addClass('active');
      this.showSelectedSection();
    },

    activateItem: function(e){
      $target = $(e.target);
      id = $target.data('item');
      $('.thumb_image', $target.closest('.thumb_links')).removeClass('active');
      $target.addClass('active');
      this.showSelectedItem();
    },

    initializeAllFirstItems: function(){
      $('.thumb_image:first', this.$thumb_links).addClass('active')
      $('a:first', '.sub_menu').addClass('active');
      this.showSelectedSection();
      this.showSelectedItem();
    },

    showSelectedSection: function(){
      $target = $('a.active', '.sub_menu');
      anchor = $target.attr('href')
      $('.portfolio_section', '.page').removeClass('active');
      $(anchor).addClass('active');
    },

    showSelectedItem: function(){
      $('.portfolio_item_art', this.$portfolio_section).removeClass('active');
      $('.thumb_image.active', this.$thumb_links).each(function(index, item){
        item_id = $(item).data('item');
        $item = $('#item_'+item_id, this.$portfolio_section);
        $item.addClass('active');
        $('img', $item).hide().fadeIn();
      })
    }
  }),

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
