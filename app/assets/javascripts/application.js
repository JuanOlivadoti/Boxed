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
//= require materialize-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .
$(document).on('turbolinks:load', function(){

	// =============== DATE PICKER
	$('.btn-flat picker__close').click(function(event){

		var dtpikd = document.getElementById('js-tc-datepick').value();
		console.log(dtpikd);

	});

	$('.datepicker').pickadate({

    selectMonths: true, // Creates a dropdown to control month
    selectYears: 80 // Creates a dropdown of 15 years to control year
  });

		// =============== PARALLAX
  $('.parallax').parallax();

	// =============== DATE PICKER
	var scroll_start = 0;
	var startchange = $('.nav');
	var offset = startchange.offset();
	
	$(document).scroll(function() { 
	  scroll_start = $(this).scrollTop();
	  if(scroll_start > offset.top) {
	      $('.nav').css('background-color', 'rgba(255,255,255,1)');
	      $('li.top a').css('color', '#000');
	      $('header #logo').css('color', '#FFF');
	      $('header #logo:hover').css('color', '#FC3C2A');
	   } else {
	      $('.nav').css('background-color', 'rgba(255,255,255,0.1)');
	      $('li.top a').css('color', '#FFF');
	      $('header #logo').css('color', '#FFF');
	      $('header #logo:hover').css('color', '#FC3C2A');
	   }
	});
});