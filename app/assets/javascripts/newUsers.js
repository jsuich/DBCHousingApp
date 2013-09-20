var geocoder;
var map;
var markers = [];
var latlng = new google.maps.LatLng(41.8899109, -87.6376566);
var geocoder = new google.maps.Geocoder();


function initialize() {
  var mapOptions = {
    zoom: 14,
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
      console.log(results[0].geometry.location);
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


function handleButtons () {
  $('input[type="submit"]').hide();
  $('.yesno').hide();

  $('.check').click(function(event) {
    event.preventDefault();
    $(this).hide();


    codeAddress();

    $('.no').click(function(event) {
      event.preventDefault()
      $('#user_street_address').focus();
      $(this).parent().hide();
      $('.check').show();

      deleteMarkers();
    });

    $('.yes').click(function(event) {
      event.preventDefault();
      $('.newUserWrapper form').submit();
    });

  });
}


function deleteMarkers () {
  for (var i = 0; i < markers.length; i++) {
    markers[i].setMap(null);
  }
  markers = [];
}




$(document).ready(function() {
// console.log($('.newUserWrapper'));
if ($('.newUserWrapper').length > 0){
  initialize();
  handleButtons();
  }



});
