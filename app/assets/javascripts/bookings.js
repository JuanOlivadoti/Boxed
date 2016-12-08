$(document).ready(function(){
	
	function handleErrors(errors){
	console.log(errors);
	}
	// DESTROY USER BOOKING

	$('#js-burn').click(function(event){
		event.preventDefault();
		var uId = $(event.target).data('u-id');
		var tId = $(event.target).data('t-id');
		var bId = $(event.target).data('b-id');

		console.log(uId);
		console.log(tId);
		console.log(bId);

		$.ajax ({
			type: "DELETE",
			url: "/bookings/" + bId,
			data: {id: bId},
			success: burn,
			error: handleErrors
		});

	});

	function burn (response){
		console.log("Burn!!");
		var bId = $('#js-burn').data('b-id');

		console.log(response);
		console.log(bId);

		$("#booking-" + bId).remove();
	}


});