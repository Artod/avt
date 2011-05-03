// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


$(document).ready(function() {
	$('#search_form').bind('ajax:success', function(evt, data, status, xhr){
		var response = $.parseJSON(xhr.responseText);
		if (!response.length) {
			$('#result').html("Not found");
			return false;
		}
		
		var items = [];
		$.each(response, function(key, val) {
			var destination = val.destination;
			var price = val.price;
			items.push("<tr> \
				<td>" + destination.id + "</td> \
				<td>" + destination.latitude + "</td> \
				<td>" + destination.longitude + "</td> \
				<td>" + price.value + "</td> \
				<td>" + price.depart_date + "</td> \
				<td>" + price.return_date + "</td> \
			</tr>");
		});
		
		$('#result').html(" \
			<h3>Result:</h3> \
			<table> \
				<tr> \
					<th>destination_id</th> \
					<th>latitude</th> \
					<th>longitude</th> \
					<th>price</th> \
					<th>depart_date</th> \
					<th>return_date</th> \
				</tr> \
				"+items+" \
			</table> \
		<h4>JSON:</h4> \
		"+xhr.responseText+" \
		");
	});
});

		// eval(xhr.responseText);
		// $('#result').html(data.toString);
		// alert(fnShowProps(xhr, 'xhr'));
		// fnShowProps(data, 'data')
		// eval(response.text)