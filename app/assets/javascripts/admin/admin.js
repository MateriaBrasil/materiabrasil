window.Admin = {

  initialize: function(){
    this.showCategory();
    this.watchCategoryChange();

    $('select').chosen({
      no_results_text: "Nenhum resultado encontrado para ",
      allow_single_deselect: true
    });
  },

  showCategory: function(){
    $('.category .categories').first().addClass('active');
  },

  watchCategoryChange: function(){
    $('.category h4').live('click', function(){
      var self = $(this);

      if (!self.hasClass('active')) {
        $('.category .categories').removeClass('active');
        self.parent('.category').children('div').children('ul').addClass('active');
      }
    });
  }
}


$(document).ready(function(){
  Admin.initialize();
})
