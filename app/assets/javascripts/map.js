function initialize() {
  geocoder = new google.maps.Geocoder();
  var latlng = new google.maps.LatLng(41.8899109, -87.6376566);
  var mapOptions = {
    zoom: 10,
    center: latlng,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }
  map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
}

function codeAddress() {
  var address = $('#user_street_address').val() + ', ' + $('#user_city').val();
  geocoder.geocode( { 'address': address}, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      map.setCenter(results[0].geometry.location);
      var marker = new google.maps.Marker({
          map: map,
          position: results[0].geometry.location
      });


      $('.error').hide();
      $('.yesno').show();
      $('#user_json').val(JSON.stringify(results));

      markers.push(marker);


    } else {
      $('.error').text("Google couldn't find that address! :(");
      $('.check').show();

    }
  });
}










$(document).ready(function() {

if ($('.mapWrapper').length > 0){
  initialize();
  codeAddress();
  console.log('words');
  }



});
