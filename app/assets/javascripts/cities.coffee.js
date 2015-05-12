
$(document).ready(function() {
$('#search-form input').on('keyup', runSearch);
google.maps.event.addDomListener(window, 'load', initialize);
 google.maps.event.addDomListener(window, 'load', codeAddress);
});


var runSearch = function() {
    var fuzzySearchText = '^(?=.*\\b' + $.trim($(this).val()).split(/\s+/).join('\\b)(?=.*\\b') + ').*$';
    // console.log(fuzzySearchText);
    var form = this;
    // console.log(form);
    var reg = RegExp(fuzzySearchText, 'i');
    // For HomePage:
    $('.city-detail').show();
    $('.city-detail').filter(function() {
        searchText = $(this).children().children().attr('id').replace(/\s+/g, ' ');
        return !reg.test(searchText);
    }).hide();

    //For myCities:
    $('.my-city').show();
    $('.my-city').filter(function() {
        searchText = $(this).text().replace(/\s+/g, ' ');
        return !reg.test(searchText);
    }).hide();

    //for myAttractions:
    $('.my-attractions').show();
    $('.my-attractions').filter(function() {
        searchText = $(this).children().children().children().attr('id').replace(/\s+/g, ' ');
        return !reg.test(searchText);
    }).hide();
  };
    



var geocoder;
var map;
var initialize = function() {
  geocoder = new google.maps.Geocoder();
  var latlng = new google.maps.LatLng(40.708116, -73.957070);
  var mapOptions = {
    zoom: 15,
    center: latlng
  };
  map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
};

var codeAddress=function() {
  var address = $('#address').text();
    var icon = $('#icon').children().attr('src');
    console.log(icon);
  geocoder.geocode( { 'address': address}, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      map.setCenter(results[0].geometry.location);
      var marker = new google.maps.Marker({
          map: map,
          position: results[0].geometry.location,
          title: address,
          icon: icon
      });
    } else {
      alert('Geocode was not successful for the following reason: ' + status);
    }
  });
};
