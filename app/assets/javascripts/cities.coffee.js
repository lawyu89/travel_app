$(document).ready(function() {

  var GOOGLE_MAPS_LOADED = !!window.google;

  var runSearch = function() {
    var fuzzySearchText = '^(?=.*\\b' + $.trim($(this).val()).split(/\s+/).join('\\b)(?=.*\\b') + ').*$';
    var form = this;
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


  var showCityDesc = function(){
      $(this).find('img').fadeTo('slow', 0.3)
      $(this).find('.city-description').fadeIn('slow')
  };

  var showMap = function(e){
    e.preventDefault();
    console.log('put the map here');
  };

  var geocoder;
  var map;
  var initializeMap = function() {
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
        console.log('Geocode was not successful for the following reason: ' + status);
      }
    });
  };



// Event Bindings:
  $('#search-form input').on('keyup', runSearch);
  $('#map').on('click', function(){
   var myhref = $(this).attr("href");
   console.log(href);
    window.location.href=window.location.myhref})

  if (GOOGLE_MAPS_LOADED){ 
    initializeMap(); 
    codeAddress();
  }
  
  $(".se-pre-con").fadeOut("slow");
  $('#search-form input').on('keyup', runSearch);
  $('.total-page-container').on('taphold', '.city-detail', showCityDesc);

});

