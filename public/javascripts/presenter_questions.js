var jQT = new $.jQTouch({
	icon: 'jqtouch.png',
	addGlossToIcon: false,
	startupScreen: 'jqt_startup.png',
	statusBar: 'black'
});

$(function() {


	// window.location.pathname 
	$("#enter_button").mousedown(function() {
		var tvalue = document.getElementById("home_form").value;
		var webpage = "http://localhost:3000" + "/" + tvalue; 
		//var webpage =  <%=  root_url %> + "/" + tvalue;

		$.ajax({
		    type: 'HEAD',
		    url: webpage,
		success: function() {
		        window.location = webpage;
		},
		error: function() {
		alert(webpage);
		}
		});

	});

	// We pass "updateLocation" a callback function,
	// to run once we have the coordinates.
	// We also set it to a variable, so we can know
	// right away if it's working or not
	var lookup = jQT.updateLocation(function(coords) {
		if (coords) {
			//window.location = "http://www.google.com/" + coords.latitude + coords.longitude;
			window.location = "http://localhost:3000/presentations/edit?"+"lat=" + coords.latitude + "&lon=" + coords.longitude;
			
			//setDisplay('Latitude: ' + coords.latitude + '<br />Longitude: ' + coords.longitude);

		} else {
			setDisplay('Device not capable of geo-location.');
		}
	});

	if (lookup) {
		setDisplay('Looking up location&hellip;');

	}
});
