App.Pages = {

  About: Backbone.View.extend({
    initialize: function(){
      _.bindAll(this);

      App.Common.initFacebook();
    }
  })

}
