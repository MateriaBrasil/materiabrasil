(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=310127662355164";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

(function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs"));

document.getElementById('mailee-form').onsubmit = function(){
  re = /^[a-z0-9\._-]+@([a-z0-9][a-z0-9-_]*[a-z0-9-_]\.)+([a-z-_]+\.)?([a-z-_]+)$/
    if(!this.email.value.match(re)) {
      alert("Por favor, preencha corretamente o email");
      this.email.focus();
      return false;
    }
  return true;
};


var _gaq = _gaq || [];
_gaq.push(['_setAccount', 'UA-29468390-1']);
_gaq.push(['_trackPageview']);

(function() {
  var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
  ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
  var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
})();


var App = window.App = {

  init: function(){
    this.getTwitterStatus();
  },

  getTwitterStatus: function(){
    $.getJSON("https://twitter.com/statuses/user_timeline/materiabrasil.json?callback=?", function(data){
      $(".networks .twitter blockquote").html(data[0].text);
    });
  }
};

App.init();

$(document).ready(function(){
  $('.parent .head').click(function(){
    var self = $(this);
    self.siblings('ol.is_children').slideToggle();
  })
});
