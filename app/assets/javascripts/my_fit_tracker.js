$(document).on('turbolinks:load', function(){

	console.log("fit tracker ready");

	function handleErrors(errors){
	console.log(errors);
	}

  // SELECT EXERCISE TYPE
// $('select').material_select();

	$('#submit').click(function(event){
		event.preventDefault();
		var uId = $('#submit').data('user-id');
		var exer = $('#exercise').val();
		var valu = $('#value').val();
		var um = $('#um').val();
		var exty = $('#exercise_type option:selected').val();

		$.ajax ({
			type: "POST",
			url: "/users/"+uId+"/my_fit_tracker",
			data: {
				user_id: uId,
				exercise: exer,
				value: valu,
				um: um,
				exercise_type: exty
			},
			success: fittrackcreate,
			error: handleErrors
		});

	});

	function fittrackcreate (response){
		console.log("created!");
		console.log(response);
		// debugger
		var crea 	= response.created_at.substring(0, 10);
		var exer 	= response.exercise;
		var valu 	= response.value;
		var um 		= response.um;
		var exty 	= response.exercise_type;

		console.log(crea);

		var newtrack = '<ul id="exe-list" data-t="'+response.id+'" class="collection">' +
			  '<li class="collection-item red darken-3">' +
			  	'<div class="row">' +
			  		'<div class="col s2">' +
							'<p>'+crea+'</p>' +
			  		'</div>' +
			  		'<div class="col s4">' +
							'<p>'+exer+'</p>' +
			  		'</div>' +
			  		'<div class="col s1">' +
							'<p>'+valu+'</p>' +
			  		'</div>' +
			  		'<div class="col s1">' +
							'<p>'+um+'</p>' +
			  		'</div>' +
			  		'<div class="col s3">' +
							'<p>'+exty+'</p>' +
			  		'</div>' +
			  		'<div class="col s1">' +
							'<a data-confirm="Are you sure?" class="btn-floating btn-large waves-effect waves-light red-text text-darken-3 white" rel="nofollow" data-method="delete" href="/users/1/my_fit_tracker?id='+response.id+'">BURN</a>' +
			  		'</div>' +
			  	'</div>' +
			  '</li>' +
			'</ul>';

		console.log(newtrack);
		$('#tracks').prepend(newtrack);

	}

	$('#burn-tracker').click(function(event){
		event.preventDefault();
		var tId = $('#burn-tracker').data('track-id');
		var uId = $('#burn-tracker').data('u-id');


		console.log(tId);
		console.log(uId);

		$.ajax ({
			type: "DELETE",
			url: "/users/"+uId+"/my_fit_tracker/"+tId,
			data: {
				user_id: uId,
				id: tId,
			},
			success: fittrackdestroy,
			error: handleErrors
		});

	});

	function fittrackdestroy (response){
		console.log("Burned!");
		console.log(response);
	}

		$('#exercise').autocomplete({
	  data: {
	    "Back squat": null,
			"Back squat (light)Squat": null,
			"Barbell bent over row": null,
			"Bench press Clean": null,
			"Clean & Jerk Cluster": null,
			"Deadlift": null,
			"Dumbbell Clean & Jerk": null,
			"Dumbbell Deadlift": null,
			"Dumbbell front squat": null,
			"Dumbbell": null,
			"Dumbbell Jerk": null,
			"Dumbbell power clean": null,
			"Dumbbell Push Press": null,
			"Dumbbell shoulder press": null,
			"Dumbbell Shoulder to overhead": null,
			"Dumbbell Squat Clean": null,
			"Dumbbell Sumo deadlift high pull": null,
			"Dumbbell Thrustertumblr_mzr1nuscqv1qgm1pho1_500": null,
			"Dumbbell Waiter walk": null,
			"Farmer carry": null,
			"Front squat": null,
			"Good morning": null,
			"Ground to Overhead": null,
			"Hang power clean": null,
			"Hang power snatch": null,
			"Hang squat clean": null,
			"Jerk": null,
			"Medicine ball clean (10kgs/22lbs medball)": null,
			"Medicine ball clean (5kgs/11lbs medball)": null,
			"One-arm Dumbbell Snatch": null,
			"Overhead squat": null,
			"Overhead walk": null,
			"Overhead walking lunges": null,
			"Overhead walking lunges (with dumbbells)Snatch Crossfit": null,
			"Power clean": null,
			"Power snatch": null,
			"Push Press Shoulder press": null,
			"Shoulder to overhead": null,
			"Snatch Snatch balance": null,
			"Sots press": null,
			"Sumo deadlift high pull": null,
			"Thruster": null,
			"Two-hand dumbbell Bent over row": null,
			"Zercher squat": null,
			"Barbell Turkish Get-up": null,
			"Dumbbell Swing": null,
			"Dumbbell Turkish Get-upKettlebell Single Front Snatch": null,
			"Goblet squat (16 kg KB)": null,
			"Goblet squat (24 kg KB)": null,
			"Goblet squat (32 kg KB)": null,
			"Kettlebell snatch (16 kg KB)": null,
			"Kettlebell snatch (24 kg KB)": null,
			"Kettlebell swing (16 kg KB)": null,
			"Kettlebell swing (24 kg KB)": null,
			"Kettlebell swing (32 kg KB)": null,
			"One-arm kettlebell swing (16 kg KB)": null,
			"Turkish Get-up (16 kg KB)": null,
			"Turkish Get-up (24 kg KB)": null,
			"Turkish Get-up (32 kg KB)": null,
			"Swimming": null,
			"Rowing": null,
			"Running": null,
			"Air Squathandstand": null,
			"Assisted Pull-up": null,
			"Back extension": null,
			"Bar Muscle up": null,
			"Box jump": null,
			"Broad jump": null,
			"Burpee": null,
			"Burpee – Bar muscle-up": null,
			"Burpee – Box jump": null,
			"Burpee – Chest-to-bar Pull-up – Push-up": null,
			"Burpee – Chest-to-bar Pull-up – Ring dip": null,
			"Burpee – Chest-to-bar Pull-up – Static dip": null,
			"Burpee – Lateral Jump": null,
			"Burpee – Muscle-up": null,
			"Burpee – Pull-up – Push-up": null,
			"Burpee – Pull-up – Ring dip": null,
			"Burpee – Pull-up – Static dipring-dips": null,
			"Burpee – Ring row": null,
			"Burpee – Ring row – Push-up": null,
			"Burpee – Ring row – Static dip": null,
			"Burpee – Toes-to-bar": null,
			"Burpee Pull-up": null,
			"Chest-to-bar pull-up": null,
			"Deficit push-up": null,
			"GHD sit-up": null,
			"GHD Wall ball (5kgs/11lbs medball)": null,
			"Handstand": null,
			"Handstand push-up": null,
			"Hanging hip touches": null,
			"Hanging ring extension": null,
			"Hip extension": null,
			"Hip-Back extension": null,
			"Inverted Burpee": null,
			"Jumping jack": null,
			"Jumping Pull-up": null,
			"Knees to elbowsRope Climb 2": null,
			"Ladies’ push-up": null,
			"L-pull-up": null,
			"Lunge Lying leg raises": null,
			"Muscle up": null,
			"Pistol Pistol progression": null,
			"Plank": null,
			"Pull-up Push-up": null,
			"Ring dip": null,
			"Ring L-sit": null,
			"Ring pull-up": null,
			"Ring row": null,
			"Ring Tuck hold (L-sit progression)": null,
			"Rope climb": null,
			"Sit-up": null,
			"Sit-up Wall ball (5kgs/11lbs medball)": null,
			"Stair step ascent": null,
			"Stair step descent": null,
			"Static bar L-sit": null,
			"Static bar Tuck hold (L-sit progression)": null,
			"Static Dip": null,
			"Static hang": null,
			"Strict pull-up": null,
			"Strict Ring pull-up": null,
			"Superman": null,
			"Toes-to-bar": null,
			"Toes-to-rings": null,
			"Tuck jump": null,
			"Walking Lunge": null,
			"Wall climb": null,
	  },
		select: function(event){
			$(this).hide();
		}
	})

});