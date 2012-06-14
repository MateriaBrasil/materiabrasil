App.Materials = {


  Show: Backbone.View.extend({
    el: 'body',
    events: {
      "click li.indicator" : "showIndicatorChildren"
    },
    
    showIndicatorChildren: function(event){
      var klass = this.$(event.target);
      var att  = klass.attr('data-type');
      this.$('ul.children').hide();
      this.$('li.indicator').removeClass('highlighted');
      this.$('li.indicator[data-type="'+att+'"]').addClass('highlighted');
      this.$('ul.children[data-type="'+att+'"]').fadeIn();

    }




  })



}
