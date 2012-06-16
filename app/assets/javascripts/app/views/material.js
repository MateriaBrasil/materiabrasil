App.Materials = {


  Show: Backbone.View.extend({
    el: 'body',
    events: {
      "click li.indicator" : "activateIndicator"
    },

    initialize: function(){
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
