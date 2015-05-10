$( document ).ready(function() {
  $('body').on('click', '.hidden',function(event){
    event.preventDefault();
  })
  if ($('.hidden').length > 0){
    var current = $('.hidden').first()
    current.css("display", "inline")
    current.attr("id", "swipe")

    $("#swipe").on( "swipeleft", swipeLeft );
    $("#swipe").on( "swiperight", swipeRight );

  // Callback function references the event target and adds the 'swipe' class to it
    function swipeLeft(event){
      console.log("IN SWIPE LEFT FUNCTION")
      event.preventDefault();
      $(this).css("display", "none")
      $(this).attr("id", "")
      var next_item = $(this).next()
      next_item.css("display", "inline")
      next_item.attr("id", "swipe")
      debugger
      $("#swipe").on( "swipeleft", swipeLeft );
      // var response = $.ajax({
      //   type: 'POST',
      //   url: $(this).attr('href'),
      //   dataType: 'json'
      // })
      //
      // response.done(function(data){
      //   console.log('AJAX SUCCEEDED')
      //   console.log(data)
      // })
      //
      // response.fail(function(data){
      //   console.log('AJAX FAILED FUCK')
      //   console.log(data)
      // })
    }

    function swipeRight(event){

    }
  }
});
