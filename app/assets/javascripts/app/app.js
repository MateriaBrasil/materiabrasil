var App = window.App = {
  Common: { 
    
    init: function() {
      jQuery("select").chosen({no_results_text: "Nenhum resultado encontrado para"});
      var $flash = $('.flash');
      if( !$('a', $flash).length) setTimeout( function(){ $flash.slideUp() }, 5500);
      $(window).on('click', function(){ $flash.slideUp()});
      $portfolio_link = $('#portfolio_link', '.main_nav');
      href = $portfolio_link.attr('href').replace(/#.*/g, '');
      $portfolio_link.attr('href', href);
    },

    initFacebook: function(){
      return (function(d,s,id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = "//connect.facebook.net/pt_BR/all.js#xfbml=1";
        fjs.parentNode.insertBefore(js, fjs);
      }(document, 'script', 'facebook-jssdk'));
    }

  } 
};

