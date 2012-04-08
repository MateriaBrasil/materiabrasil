window.Admin = {

  initialize: function(){
    this.showCategory();
    this.watchCategoryChange();
    this.selectParentFromSelectChoice();

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
  },

  selectParentFromSelectChoice: function(){
    $('input.parent').live('change', function(){
      var self = $(this);
      var lower = self.parents('li').children('ul');
      if (!self.attr('checked')){
        var child = lower.children('li');
        child.find('input').each(function(){
          $(this).attr('checked', '');
        })
      }
    });

    $('input.child').live('change', function(){
      var self = $(this);
      var upper = self.parent().parent().parent().siblings('label');
      if (self.attr('checked')){
        upper.find('input').attr('checked', 'checked');
      }
    });
    $('input.sec_child').live('change', function(){
      var self = $(this);
      var upper = self.parent().parent().parent().siblings('label');

      if (self.attr('checked')){
        upper.find('input').attr('checked', 'checked');
        upper.find('input').trigger('change');
      } else {
        upper.find('input').attr('checked', '');
        upper.find('input').trigger('change');
      }
    })
  },
}


$(document).ready(function(){
  Admin.initialize();
})
