$( document).ready(function() {
  if ($('.hidden').length > 0){
    var current = $('.hidden').first()
    current.attr("id", "swipe")
    current.removeClass("hidden")
    $("#swipe").on("swipeleft", swipeLeft);
    $("#swipe").on("swiperight", swipeRight);
    // $("#swipe").on("tap", findDescription);
    $(".attractions-container").on("tap", '#swipe',function(event){
      event.preventDefault()
      $(this).toggleClass('flip')
    });


  // Callback function references the event target and adds the 'swipe' class to it
    function swipeLeft(event){
      event.preventDefault();
      $(this).attr("id", "")
      $(this).addClass("hidden")
      var next_item = $(this).next()
      next_item.attr("id", "swipe")
      next_item.removeClass("hidden")
      $("#swipe").on("swipeleft", swipeLeft);
      $("#swipe").on("swiperight", swipeRight);
      //$("#swipe").on("tap", findDescription);

    //   var response = $.ajax({
    //     type: 'POST',
    //     url: $(this).find('a').attr('href')+'/dislike',
    //     dataType: 'json'
    //   })

    //   response.done(function(data){
    //     console.log('AJAX SUCCEEDED')
    //     console.log(data)
    //   })

    //   response.fail(function(data){
    //     console.log('AJAX FAILED FUCK')
    //     console.log(data)
    //   })
    }

    function swipeRight(event){
      event.preventDefault();
      console.log(event.type)
      console.log('right')
      $(this).attr("id", "")
      $(this).addClass('hidden')
      var next_item = $(this).next()
      next_item.removeClass("hidden")
      next_item.attr("id", "swipe")
      $("#swipe").on("swiperight", swipeRight);
      $("#swipe").on("swipeleft", swipeLeft);
      //$("#swipe").on("tap", findDescription);
      // var response = $.ajax({
      //   type: 'POST',
      //   url: $(this).attr('href')+'/like',
      //   dataType: 'json'
      // })

      // response.done(function(data){
      //   console.log('AJAX SUCCEEDED')
      //   console.log(data)
      // })

      // response.fail(function(data){
      //   console.log('AJAX FAILED FUCK')
      //   console.log(data)
      // })
    }
  }
});
