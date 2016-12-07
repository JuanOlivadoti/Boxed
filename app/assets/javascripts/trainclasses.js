function handleOnSuccess(content){

	console.log(content);
		
}

function handleOnError (error) {
	console.log(error);
}

$(document).ready(function(){
	event.preventDefault;
	console.log("document ready");

	$('#js-book').click(function(event){
		console.log("loaded");

		var classId = $('[data-train-id]').data('train-id');
		var userId	= $('[data-user-id]').data('user-id');

		console.log(classId);
		console.log(userId);

		$.ajax({
			type: "POST",
			url: `/users/${userId}/trainclass/add`,
			data: {trainclass_id: classId},
			success: handleOnSuccess,
			error: handleOnError
		});

	});

});