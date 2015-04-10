// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function(){
  // URL Param Function shim http://stackoverflow.com/questions/19491336/get-url-parameter-jquery
  function getUrlParameter(sParam) {
    var sPageURL = window.location.search.substring(1);
    var sURLVariables = sPageURL.split('&');
    for (var i = 0; i < sURLVariables.length; i++) {
      var sParameterName = sURLVariables[i].split('=');
      if (sParameterName[0] == sParam) {
        return sParameterName[1];
      }
    }
  }

  // Update active button for sort order on index page
  var sort_order = getUrlParameter('sort_order') || '',
      parent = $('.question-sort');
  if (sort_order == 'voted') {
    parent.find('.active').removeClass('active');
    parent.find('.top-voted').addClass('active');
  } else if (sort_order == 'commented') {
    parent.find('.active').removeClass('active');
    parent.find('.trending').addClass('active');
  };
});