
$(document).ready(function() {
  // console.log("i am ready");
$(".se-pre-con").fadeOut("slow");;
$('#search-form input').on('keyup', runSearch);
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





