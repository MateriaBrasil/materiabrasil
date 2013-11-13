var Router = Backbone.Router.extend({
  routes : {
    ':name/:item' : 'showCurrentPortfolio'
  },

  initialize: function(options){
    if(options && options.Portfolio){
      this.Portfolio = options.Portfolio;
    }
  },

  showCurrentPortfolio: function(name, item){
    if(this.Portfolio){
      this.Portfolio.activateFromURL(name, item);
    }
  }
});

App.Pages = {

  Portfolio: Backbone.View.extend({
    el: 'body',
    events: {
      'click .thumb_image' : 'activateItem',
      'click .sub_menu a' : 'activateSection'
    },

    initialize: function(){
      _.bindAll(this);
      this.router = new Router({Portfolio: this});
      Backbone.history.start();
      this.$portfolio_section = $('.portfolio_section');
      this.$thumb_links = $('.thumb_links', this.$portfolio_section);
      this.initializeAllFirstItems();
    },

    activateFromURL: function(name, item){
      $('a', '.sub_menu').removeClass('active');
      $('a[href="#' + name + '"]', '.sub_menu').addClass('active');
      $('.thumb_image', '.thumb_links').removeClass('active');
      $('.thumb_image[data-item="' + item + '"]', '.thumb_links').addClass('active');
      this.showSelectedSection();
      this.showSelectedItem();
    },

    activateSection: function(e){
      e.preventDefault();
      $target = $(e.target);
      name = $target.attr('href').replace('#','');
      item = $('.thumb_image:first', '#'+name).data('item');
      this.router.navigate(name + "/" + item, true);
    },

    activateItem: function(e){
      $target = $(e.target);
      item = $target.data('item');
      $('.thumb_image', $target.closest('.thumb_links')).removeClass('active');
      $target.addClass('active');
      name = $target.closest('.portfolio_section').attr('id');
      this.router.navigate(name + "/" + item, true);
    },

    initializeAllFirstItems: function(){
      if(Backbone.history.fragment.indexOf('/') == -1){
        name = $('.portfolio_section:first').attr('id');
        item = $('.thumb_image:first', this.$thumb_links).data('item');
        this.router.navigate(name + "/" + item, true);
      }
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
  })

}
App.Common.initFacebook();