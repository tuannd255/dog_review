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

$(document).on("turbolinks:load ajaxComplete", function() {
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

  $("#rate-1").hover(function(){
    $("#rate-1").before().toggleClass("color-hover-");
  });
  $("#rate-2").hover(function(){
    $("#rate-2").before().toggleClass("color-hover-");
    $("#rate-1").before().toggleClass("color-hover-");
  });
  $("#rate-3").hover(function(){
    $("#rate-2").before().toggleClass("color-hover-");
    $("#rate-1").before().toggleClass("color-hover-");
    $("#rate-3").before().toggleClass("color-hover-");
  });
  $("#rate-4").hover(function(){
    $("#rate-2").before().toggleClass("color-hover-");
    $("#rate-1").before().toggleClass("color-hover-");
    $("#rate-3").before().toggleClass("color-hover-");
    $("#rate-4").before().toggleClass("color-hover-");
  });
  $("#rate-5").hover(function(){
    $("#rate-2").before().toggleClass("color-hover-");
    $("#rate-1").before().toggleClass("color-hover-");
    $("#rate-3").before().toggleClass("color-hover-");
    $("#rate-4").before().toggleClass("color-hover-");
    $("#rate-5").before().toggleClass("color-hover-");
  });

  $(".edit-review").click(function() {
    $(window).scrollTop($('.form-review').offset().top);
  });

  if ($('.compare').length > 0) {
    $('.compare_now').click(function(){
      var a = $('.compare').children().length;
      if (a == 1) {
        alert("Give 2 dog in compare");
      } else if (a > 3) {
        alert("Give max 3 dog in compare");
      } else {
        link = "/compares?";
        for (i = 0; i < a; ++i) {
          link = link + "dog_" + i + "=" + $($('.compare').children()[i]).data('id');
          if (i < a - 1) {
            link = link + "&";
          }
        };
        document.location.href = link;
      }
    });
  };

  $('#category_id').change(function() {
    document.location.href = "/dogs?category_id=" + $(this).val();
  });
});
function change_select(){
  var e = document.getElementById("search_dog");
  var select_option = e.options[e.selectedIndex].value;

  var e = document.getElementById("search_dog");
  var select_option = e.options[e.selectedIndex].text;
  add_link = $('#search');
  if (select_option == "height" || select_option == "weight") {
    $('.search-2').removeClass('hidden');
    $('.show-from').removeClass('hidden');
    add_link.attr("placeholder", "From");
  } else if (select_option == "name"){
    $('.search-2').addClass('hidden');
    $('.show-from').addClass('hidden');
    add_link.attr("placeholder", "Name");
  }
};



