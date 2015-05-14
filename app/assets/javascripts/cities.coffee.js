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
            console.log($(this).children().attr("id"));
            searchText = $(this).children().attr("id").replace(/\s+/g, ' ');
            return !reg.test(searchText);
        }).hide();

        //for myAttractions:
        $('.my-attractions').show();
        $('.my-attractions').filter(function() {
            searchText = $(this).children().children().children().attr('id').replace(/\s+/g, ' ');
            return !reg.test(searchText);
        }).hide();
    };


    var showCityDesc = function() {
        $(this).find('img').fadeTo('slow', 0.3)
        $(this).find('.city-description').fadeIn('slow');
    };


  function initializeMap() {
	  var icon_img = $('#icon').children().attr('src');
      var icon = { url: icon_img, scaledSize: new google.maps.Size(30, 40) };
	  var myLat = $('#mylat').text();
	  var myLong = $('#mylong').text();
      var myTitle = $('#mapTitle').text();
	  var myLatlng = new google.maps.LatLng(myLat,myLong);
	  var mapOptions = {
	    zoom: 15,
	    center: myLatlng
	  };
	  var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

	  var marker = new google.maps.Marker({
	      position: myLatlng,
	      map: map,
	      icon: icon,
          title: myTitle
	  });
	}


    function multiSetUp() {
    var locations = JSON.parse($('#attraction_id_tag').attr("data"));
        locations = locations.map(function(location) {
            return location.split(",");
        });

    var icon_img = $('#iconsmall').children().attr('src');

    window.map = new google.maps.Map(document.getElementById('multi-map'), {
        mapTypeId: google.maps.MapTypeId.ROADMAP
    });

    var infowindow = new google.maps.InfoWindow();

    var bounds = new google.maps.LatLngBounds();
    
    var offset = Math.floor(Math.random() * 3) * 16; // pick one of the three icons in the sprite

    // Calculate desired pixel-size of the marker
    var size = Math.floor(10);
    var icon = { url: icon_img, scaledSize: new google.maps.Size(30, 40) };
    
    for (i = 0; i < locations.length; i++) {
        marker = new google.maps.Marker({
            position: new google.maps.LatLng(locations[i][1], locations[i][2]),
            map: map,
            icon: icon,
            title: locations[i][0]  
        });

        bounds.extend(marker.position);

        google.maps.event.addListener(marker, 'click', (function (marker, i) {
            return function () {
                infowindow.setContent(locations[i][0]);
                infowindow.open(map, marker);
            }
        })(marker, i));
    }

    map.fitBounds(bounds);

    var listener = google.maps.event.addListener(map, "idle", function () {
        map.setZoom(10);
        google.maps.event.removeListener(listener);
    });
}



    // Event Bindings:
    $('#search-form input').on('keyup', runSearch);

    if (GOOGLE_MAPS_LOADED) {
        $('#map-canvas').length > 0 ? initializeMap() : multiSetUp();
    };

    $(".se-pre-con").fadeOut("slow");
    $('#search-form input').on('keyup', runSearch);
    // $('.total-page-container').on('taphold', '.city-detail', showCityDesc);

});