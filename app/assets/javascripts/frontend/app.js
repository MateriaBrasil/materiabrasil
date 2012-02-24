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
