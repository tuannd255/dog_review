// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

$(document).on("turbolinks:load", function() {
  setTimeout(function(){
    $('.alert').slideUp(500);
  }, 2000);
  var x = $(window).height();
  var y = x - 60;
  $('.content').css('min-height', x);
  $('.page-content').css('min-height', x);
  $('.signin').css('min-height', y);


  $('form').on('click', '.remove_fields', function(event) {
    $(this).closest('.field').remove();
    return event.preventDefault();
  });
  $('form').on('click', '.add_fields', function(event) {
    var regexp, time;
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $(this).before($(this).data('fields').replace(regexp, time));
    return event.preventDefault();
    checkbox();
  });

  $("#rate-1").click(function(){
    $("#rate-1").before().addClass("color-hover");
    $("#rate-2").before().removeClass("color-hover");
    $("#rate-3").before().removeClass("color-hover");
    $("#rate-4").before().removeClass("color-hover");
    $("#rate-5").before().removeClass("color-hover");
    $("#review_rate").val(1);
  });
  $("#rate-2").click(function(){
    $("#rate-2").before().addClass("color-hover");
    $("#rate-1").before().addClass("color-hover");
    $("#rate-3").before().removeClass("color-hover");
    $("#rate-4").before().removeClass("color-hover");
    $("#rate-5").before().removeClass("color-hover");
    $("#review_rate").val(2);
  });
  $("#rate-3").click(function(){
    $("#rate-2").before().addClass("color-hover");
    $("#rate-1").before().addClass("color-hover");
    $("#rate-3").before().addClass("color-hover");
    $("#rate-4").before().removeClass("color-hover");
    $("#rate-5").before().removeClass("color-hover");
    $("#review_rate").val(3);
  });
  $("#rate-4").click(function(){
    $("#rate-2").before().addClass("color-hover");
    $("#rate-1").before().addClass("color-hover");
    $("#rate-3").before().addClass("color-hover");
    $("#rate-4").before().addClass("color-hover");
    $("#rate-5").before().removeClass("color-hover");
    $("#review_rate").val(4);
  });
  $("#rate-5").click(function(){
    $("#rate-2").before().addClass("color-hover");
    $("#rate-1").before().addClass("color-hover");
    $("#rate-3").before().addClass("color-hover");
    $("#rate-4").before().addClass("color-hover");
    $("#rate-5").before().addClass("color-hover");
    $("#review_rate").val(5);
  });
});


