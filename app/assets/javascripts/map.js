function initialize() {

  grabLocations();

  var latlng = new google.maps.LatLng(41.8899109, -87.6376566);
  var mapOptions = {
    zoom: 10,
    center: latlng,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }
  map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
}

// function codeAddress() {
//   var address = $('#user_street_address').val() + ', ' + $('#user_city').val();
//   geocoder.geocode( { 'address': address}, function(results, status) {
//     if (status == google.maps.GeocoderStatus.OK) {
//       map.setCenter(results[0].geometry.location);
//       var marker = new google.maps.Marker({
//           map: map,
//           position: results[0].geometry.location
//       });


//       $('.error').hide();
//       $('.yesno').show();
//       $('#user_json').val(JSON.stringify(results));

//       markers.push(marker);

// }


function grabLocations () {
  $.ajax({
    url: '/path/to/file',
    type: 'default GET (Other values: POST)',
    dataType: 'default: Intelligent Guess (Other values: xml, json, script, or html)',
    data: {param1: 'value1'},
  })
  .done(function() {
    console.log("success");
  })
  .fail(function() {
    console.log("error");
  })
  .always(function() {
    console.log("complete");
  });

}







$(document).ready(function() {

if ($('.mapWrapper').length > 0){
  initialize();
  codeAddress();
  console.log('words');
  }



});
