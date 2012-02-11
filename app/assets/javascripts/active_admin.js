//= require active_admin/base

$(function(){
  $('.category .categories').first().addClass('active');


  $('.category h4').live('click', function(){
    var self = $(this);

    if (!self.hasClass('active')) {
      $('.category .categories').removeClass('active');
      self.parent('.category').children('div').children('ul').addClass('active');
    }

  });
});

