$( document ).ready(function() {
    $("#swipe").on( "swipeleft", swipeLeft );
    $("#swipe").on( "swiperight", swipeRight );

  // Callback function references the event target and adds the 'swipe' class to it
  function swipeLeft(event){

    // $( event.target ).addClass( "swipe" );
    $("#swipe_status").text("LEFT");
  }

  function swipeRight(event){

    // $( event.target ).addClass( "swipe" );
    $("#swipe_status").text("RIGHT");
  }
});