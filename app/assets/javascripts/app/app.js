var App = window.App = {
  Common: { 
    
    init: function() {
      jQuery("select").chosen({no_results_text: "Nenhum resultado encontrado para"});
    
    },

    initFacebook: function(){
      return (function(d,s,id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = "//connect.facebook.net/fr_FR/all.js#xfbml=1";
        fjs.parentNode.insertBefore(js, fjs);
      }(document, 'script', 'facebook-jssdk'));
    }

  } 
};
