var infowindow

function mapInit() {

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
    url: '/grablocations',
    type: 'get',
    // dataType: 'text/javascript'
  })
  .done(function(response) {
    console.log("success");
    console.log(response);


    $(response).each(function(index, el) {
      // console.log(el);
      // var locationObject = $.parseJSON(el)
      setMarker(el);
    });


  })
  .fail(function(response) {
    console.log("error");
    console.log(response);
  })
  .always(function() {
    console.log("complete");
  });

}

function setMarker (stringArray) {
  // console.log(locationObject[0]);
  var locationObject = $.parseJSON(stringArray[1]);
  cohortsObject = $.parseJSON(stringArray[2]);
  console.log(cohortsObject);

  // console.log(locationObject);

  var latlng = new google.maps.LatLng(locationObject[0].geometry.location.ob,locationObject[0].geometry.location.pb);


  var marker = new google.maps.Marker({
          map: map,
     position: latlng
      });

    labelMarker(marker, cohortsObject);


    markers.push(marker);
    console.log(marker.get("cohort"));

  var contentString = stringArray[0];


  google.maps.event.addListener(marker, 'click', function() {
    if(infowindow) {
      infowindow.close();
    }
    infowindow = new google.maps.InfoWindow({
    content: contentString
  });
    infowindow.open(map, marker);
  });
}


function labelMarker (marker, cohorts) {
  marker.set("cohort", cohorts);

}

function checkMarkerCohorts(cohorts) {
  var result = _.some(cohorts, function (cohort) {
      return _.contains(selectedCohorts,cohort);
  });
    return result;

}

function refreshMarkers () {
  selectedCohorts = [];
  $('#mapOptions li.selected').each(function() {
    selectedCohorts.push($(this).text());
  });;
  console.log(selectedCohorts);
  console.log(markers);


  $(markers).each(function(index, marker) {
    var cohortsToTest = _.pluck(marker.cohort,'name');
    console.log(cohortsToTest);

    result = checkMarkerCohorts(cohortsToTest);
    console.log(marker.cohort);
    console.log(result);

    if(result == false){
      marker.setMap();
    }
    else{
      marker.setMap(map);
    }

  });

}


$(document).ready(function() {

if ($('.mapWrapper').length > 0){
  mapInit();
  // codeAddress();
  }


  $('#mapOptions li').click(function(event) {
    $(this).toggleClass('selected');

    refreshMarkers();
  });


});
