$(document).on('turbolinks:load', function(){
	
	function handleErrors(errors){
	console.log(errors);
	}
	// BURN HOVER BUTTONS
	$('td a').hover(function(){
  	$(this).toggleClass('red');
  	console.log("in");
  }, function(){
  	$(this).toggleClass('red');
  	console.log("out");
  });

	// USER DESTROY BOOKING

	$('#js-bks-burn').click(function(event){
		var uId = $(event.target).data('u-id');
		var tId = $(event.target).data('t-id');
		var bId = $(event.target).data('b-id');


		$.ajax ({
			type: "DELETE",
			url: "/bookings/" + bId,
			data: {id: bId},
			success: burn,
			error: handleErrors
		});

	});

	function burn (response){
		var bId = $('#js-bks-burn').data('b-id');

		console.log(response);
		console.log(bId + " Burn!");

		$("#booking-" + bId).remove();
	}

});