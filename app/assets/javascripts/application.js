// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function() {

  $('#new_addition').submit(function(e) {

    $.ajax({
      url: "/additions",
      type: "post",
      data: $('#new_addition').serialize(),

      success: function(response)
      {
        if(response.status == "true")
        {
          $('#additions').prepend('<li>' + response.content + '</li>')
        } else {
          $('body').prepend('<div class="alert alert-error">Addition not saved to database.</div>');
        }

      }
    });
    e.preventDefault();
  });


  window.fbAsyncInit = function() {
    // init the FB JS SDK
    FB.init({
      appId      : '173130539510056',                     // App ID from the app dashboard
      channelUrl : '//localhost:3000/channel.html',       // Channel file for x-domain comms
      status     : true,                                  // Check Facebook Login status
      xfbml      : true                                   // Look for social plugins on the page
    });

    // Additional initialization code such as adding Event Listeners goes here
  };

  // Load the SDK asynchronously
  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/all.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));

});