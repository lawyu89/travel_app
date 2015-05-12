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




    var initializeMap = function() {
        var geocoder;
        var map1;
        geocoder = new google.maps.Geocoder();
        var latlng = new google.maps.LatLng(40.708116, -73.957070);
        var mapOptions = {
            zoom: 15,
            center: latlng
        };
        map1 = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
        codeAddress(geocoder, map1)
    };

    var codeAddress = function(geocoder, map1) {
        var address = $('#address').text();
        var icon = $('#icon').children().attr('src');
        geocoder.geocode({
            'address': address
        }, function(results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                map1.setCenter(results[0].geometry.location);
                var marker = new google.maps.Marker({
                    map: map1,
                    position: results[0].geometry.location,
                    title: address,
                    icon: icon
                });
            } else {
                console.log('Geocode was not successful for the following reason: ' + status);
            }
        });
    };

    var multiSetUp = function() {
        var locations = [
            ['Bondi Beach', -33.890542, 151.274856, 4],
            ['Coogee Beach', -33.923036, 151.259052, 5],
            ['Cronulla Beach', -34.028249, 151.157507, 3],
            ['Manly Beach', -33.80010128657071, 151.28747820854187, 2],
            ['Maroubra Beach', -33.950198, 151.259302, 1]
        ];

        var multiMapID = $('#multi-map')[0];
        var map2 = new google.maps.Map(multiMapID, {
            zoom: 10,
            center: new google.maps.LatLng(-33.92, 151.25),
            mapTypeId: google.maps.MapTypeId.ROADMAP
        });

        var infowindow = new google.maps.InfoWindow();

        var marker2, i;

        for (i = 0; i < locations.length; i++) {
            marker2 = new google.maps.Marker({
                position: new google.maps.LatLng(locations[i][1], locations[i][2]),
                map: map2
            });
        };
        multiMap(marker2, i, map2);
    };


    var multiMap = function(marker, i, map2) {
        return function() {
            infowindow.setContent(locations[i][0]);
            infowindow.open(map2, marker2);
        };
    };

    // Event Bindings:
    $('#search-form input').on('keyup', runSearch);

    if (GOOGLE_MAPS_LOADED) {
      $('#map-canvas').length>0 ? initializeMap(): multiSetUp();
    };

    $(".se-pre-con").fadeOut("slow");
    $('#search-form input').on('keyup', runSearch);
    $('.total-page-container').on('taphold', '.city-detail', showCityDesc);

});