
$(document).ready(function() {
  // console.log("i am ready");
$('#search-form input').on('keyup', runSearch);
window.onload = loadScript; 
 // google.maps.event.addDomListener(window, 'load', initialize); 
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
    
// //Maps test1: 

var initialize = function(){
  var mapProp = {
    center: new google.maps.LatLng(48.858255, 2.294669),
    zoom:7,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  var map = new google.maps.Map(document.getElementById("googleMap"),mapProp);
};

var loadScript = function()
{
  var script = document.createElement("script");
  script.type = "text/javascript";
  script.src = "http://maps.googleapis.com/maps/api/js?key=&sensor=false&callback=initialize";
  // src="http://maps.googleapis.com/maps/api/js?key=YOUR_KEY"
  document.body.appendChild(script);
};

// Maps 2
// var initialize = function() {
//   var myLatlng = new google.maps.LatLng(-25.363882,131.044922);
//   var mapOptions = {
//     zoom: 4,
//     center: myLatlng
//   };
//   var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

//   var marker = new google.maps.Marker({
//       position: myLatlng,
//       map: map,
//       title: 'Hello World!'
//   });
// };

