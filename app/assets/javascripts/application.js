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

    selectMonths: true,
    selectYears: 80 
  });

	// =============== FULL WIDTH SLIDER ABOUT
  $('.slider').slider({full_width: true});

  	// Pause slider
  	$('#pause').click(function(){
  		$('.slider').slider('pause');
  	});
		
		// Start slider
		$('.slider').slider('start');
		// Next slide
		$('.slider').slider('next');
		// Previous slide
		$('.slider').slider('prev');

	// =============== PARALLAX
  $('.parallax').parallax();

	// =============== NAVBAR JS
	var scroll_start = 0;
	var startchange = $('.nav');
	var offset = startchange.offset();
	
	$(document).scroll(function() { 
	  scroll_start = $(this).scrollTop();
	  if(scroll_start > offset.top) {
	      $('nav').addClass('nav-scroll');
	   } else {
	      $('nav').removeClass('nav-scroll');
	   }
	});

	// =============== NAVBAR SLIDER

	$(".button-collapse").sideNav();

	$('.button-collapse').sideNav({
      menuWidth: 850, // Default is 240
      edge: 'right', // Choose the horizontal origin
      closeOnClick: true, // Closes side-nav on <a> clicks, useful for Angular/Meteor
      draggable: true // Choose whether you can drag to open on touch screens
    }
  );
});