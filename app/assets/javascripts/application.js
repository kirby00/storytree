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
//= require twitter/bootstrap
//= require bootstrap
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
          $('#additions').prepend('<li class="current_addition">' + response.content +
            '<div><a href="/additions/' + response.addition_id + '/vote_true">Up Vote</a></div>' +
            '<div class="fb-like" data-href="http://www.story-tree.co.uk/stories/<%=story.id%>" data-send="false" data-width="450" data-show-faces="false"></div></li>')
        } else {
          $('body').prepend('<div class="alert alert-error">Addition not saved to database.</div>');
        }

      }
    });
    $('textarea').val('');
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



  $(".rslides").responsiveSlides({
    auto: true,             // Boolean: Animate automatically, true or false
    speed: 1000,            // Integer: Speed of the transition, in milliseconds
    timeout: 6000,          // Integer: Time between slide transitions, in milliseconds
    pager: false,           // Boolean: Show pager, true or false
    nav: false,             // Boolean: Show navigation, true or false
    random: false,          // Boolean: Randomize the order of the slides, true or false
    pause: true,            // Boolean: Pause on hover, true or false
    pauseControls: true,    // Boolean: Pause when hovering controls, true or false
    prevText: "Previous",   // String: Text for the "previous" button
    nextText: "Next",       // String: Text for the "next" button
    maxwidth: "",           // Integer: Max-width of the slideshow, in pixels
    navContainer: "",       // Selector: Where controls should be appended to, default is after the 'ul'
    manualControls: "",     // Selector: Declare custom pager navigation
    namespace: "rslides",   // String: Change the default namespace used
    before: function(){},   // Function: Before callback
    after: function(){}     // Function: After callback
  });

  $('#tabs li a:not(:first)').addClass('inactive');
  $('.container').hide();
  $('.container:first').show();

  $('#tabs li a').click(function(){
    var t = $(this).attr('id');
  if($(this).hasClass('inactive')){ //this is the start of our condition
    $('#tabs li a').addClass('inactive');
    $(this).removeClass('inactive');

    $('.container').hide();
    $('#'+ t + 'C').fadeIn('slow');
 }
});


});