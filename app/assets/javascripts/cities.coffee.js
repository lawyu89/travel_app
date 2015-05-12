
$(document).ready(function() {
  // console.log("i am ready");
$('#search-form input').on('keyup', runSearch);
$('.total-page-container').on('taphold', '.city-detail', showCityDesc)
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

var showCityDesc = function(){
    $(this).find('img').fadeTo('slow', 0.3)
    $(this).find('.city-description').fadeIn('slow')
}



