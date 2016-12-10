$(document).ready(function(){
	
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

});