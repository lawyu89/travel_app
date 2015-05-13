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
        codeAddress(geocoder, map1);
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
                console.log(results[0].geometry.location["A"]);
                console.log(results[0].geometry.location["F"]);
            } else {
                console.log('Geocode was not successful for the following reason: ' + status);
            }
        });
    };



    var multiSetUp = function() {
        var locations2 = [];
        var geocoder = new google.maps.Geocoder();
        var attraction_data = JSON.parse($('#attraction_id_tag').attr("data"));
        console.log(attraction_data.length);

        for (var i = 0; i < attraction_data.length; i++) {
            var name = attraction_data[i];
            var results = [];
              geocoder.geocode({
                'address': attraction_data[i]
            }, function(results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    var lat = results[0].geometry.location["A"];
                    var lng = results[0].geometry.location["F"];
                    console.log(lat,lng);
                    results.push([lat, lng]);
                }
            }); // end geocode function & no ability to access the array - callback?
        };
// How do I use a callback to get the results out and into my array below!????

    var locations =
        [
            ['Coogee Beach', -33.923036, 151.259052, 5],
            ['Cronulla Beach', -34.028249, 151.157507, 3],
            ['Manly Beach', -33.80010128657071, 151.28747820854187, 2],
            ['Maroubra Beach', -33.950198, 151.259302, 1]
        ];


    var startLat = locations[0][1];
    var startLong = locations[0][2];

    var multiMapID = $('#multi-map')[0];
    var map2 = new google.maps.Map(multiMapID, {
        zoom: 10,
        center: new google.maps.LatLng(startLat, startLong),
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