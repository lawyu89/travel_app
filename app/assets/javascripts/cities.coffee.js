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


    var showCityDesc = function() {
        $(this).find('img').fadeTo('slow', 0.3)
        $(this).find('.city-description').fadeIn('slow');
    };


  function initializeMap() {
	  var icon = $('#icon').children().attr('src');
	  var myLat = $('#mylat').text();
	  var myLong = $('#mylong').text();
	  var myLatlng = new google.maps.LatLng(myLat,myLong);
	  var mapOptions = {
	    zoom: 15,
	    center: myLatlng
	  };
	  var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

	  var marker = new google.maps.Marker({
	      position: myLatlng,
	      map: map,
	      icon: icon
	  });
	}

    var multiSetUp = function() {

        var locations = JSON.parse($('#attraction_id_tag').attr("data"));
        locations = locations.map(function(location) {
            return location.split(",");
        });

        var startLat = parseInt(locations[0][1]);
        var startLong = parseInt(locations[0][2]);

        var multiMapID = $('#multi-map')[0];
        var map2 = new google.maps.Map(multiMapID, {
            zoom: 10,
            center: new google.maps.LatLng(startLat, startLong),
            mapTypeId: google.maps.MapTypeId.ROADMAP
        });

        var infowindow = new google.maps.InfoWindow();

        var marker2, i;
        var icon = $('#iconsmall').children().attr('src');

        for (i = 0; i < locations.length; i++) {
            marker2 = new google.maps.Marker({
                position: new google.maps.LatLng(locations[i][1], locations[i][2]),
                map: map2,
                icon: icon
            });
        };
    };


    var multiMap = function(marker, i, map2) {
        return function() {
            infowindow.setContent(locations[i][0]);
            infowindow.open(map2, marker2);
        };
        multiMap(marker2, i, map2);
    };



    // Event Bindings:
    $('#search-form input').on('keyup', runSearch);

    if (GOOGLE_MAPS_LOADED) {
        $('#map-canvas').length > 0 ? initializeMap() : multiSetUp();
    };

    $(".se-pre-con").fadeOut("slow");
    $('#search-form input').on('keyup', runSearch);
    $('.total-page-container').on('taphold', '.city-detail', showCityDesc);

});