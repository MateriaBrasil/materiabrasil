var Router = Backbone.Router.extend({
  routes : {
    'i/:param' : 'showPageBlock' 
  },

  showPageBlock: function(param){
    var call = "";
    switch(param) {
      case "sobre": 
        call = "about";
      break;
      case "ferramentas":
        call = "tools";
      break;
      case "modelo-de-negocio":
        call = "business_model";
      break;
      case "equipe":
        call = "team";
      break;
      case "contato":
        call = "contact";
      break;
      default:
        call = "about";
      break;

    }
    this.showChosenBlock(call);
  },
  showChosenBlock: function(block){
    $('.about section.row').hide().addClass('inactive');
    $('section.row[id='+ block +']').fadeIn().removeClass('inactive').addClass('active');
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
      Backbone.history.navigate('i/sobre', true);
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
