$(document).on('turbolinks:load', function(){
	
  // MODAL INITIALIZATION
  $('.modal').modal();

  // COLLAPSIBLE INITIALIZATION
  $('.collapsible').collapsible({
    accordion: false, 
    // onOpen: function(el) { alert('Open'); }, // Callback for Collapsible open
    // onClose: function(el) { alert('Closed'); } // Callback for Collapsible close
  });

  // DATE BUTTONS CSS
  // $('#key-buttons a:first-child').toggleClass('red');
  $('.tooltipped').tooltip({delay: 50});
  
  $('#key-buttons a').hover(function(){
  	$(this).toggleClass('red');
  }, function(){
  	$(this).toggleClass('red');
  });

	function handleErrors(errors){
	console.log(errors);
	}

	$('#js-tc-show').click(function(event){
		event.preventDefault();
		var uId = $(event.target).data('u-id');
		var tId = $(event.target).data('t-id');
		var bId = $(event.target).data('b-id');

		console.log(uId);
		console.log(tId);
		console.log(bId);

		$.ajax ({
			type: "GET",
			url: "/trainclasses/" + tId,
			data: {id: tId},
			success: show,
			error: handleErrors
		});

	});

	function show (response){
		console.log("Show me the money!!");
		var tId = $('#js-tc-show').data('t-id');

		console.log(response);
		console.log(tId + " Burn!");

		window.location.href='/trainclasses/' + tId;

	}

  // TRAINCLASSES SHOW



});