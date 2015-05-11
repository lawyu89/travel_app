$( document).ready(function() {
  if ($('.hidden').length > 0){
    var current = $('.hidden').first()
    current.attr("id", "swipe")
    current.removeClass("hidden")
    $("#swipe").on("swipeleft", swipeLeft);
    $("#swipe").on("swiperight", swipeRight);
    // $("#swipe").on("tap", findDescription);
    $(".attractions-container").on("tap", '#swipe img,h1',function(event){
      event.preventDefault()
      $(this).closest('.attraction').toggleClass('flip')
    });

    var currentButton = $('.hidden_button').first()
    currentButton.css('display', 'inline')
    $(currentButton).on('tap', '#leftb', function(e){
      var button = this
      e.preventDefault();
      runDislike(button);

    })
    $(currentButton).on('tap', '#rightb', function(e){
      var button = this
      e.preventDefault();
      runLike(button);
    })
    $(currentButton).on('tap', '#midb', function(e){
      var button = this
      e.preventDefault();
      var arr = $('.attraction')
      for (var i=0; i < arr.length; i++ ){
        var oneAttraction = arr[i]
        if (!$(oneAttraction).hasClass('hidden')) {
          $(oneAttraction).toggleClass('flip')
        }
      }
    })

    function runDislike(button){
      var url = $(button).attr('href')
      $.ajax({
        dataType: 'json',
        url: url,
        type: 'POST'
      }).done(function(data){
        console.log(data, 'SUCCESS')
      }).fail(function(data){
        console.log(data, 'FAIL')
      })
    }

    function runLike(button){
      var url = $(button).attr('href')
      $.ajax({
        dataType: 'json',
        url: url,
        type: 'POST'
      }).done(function(data){
        console.log(data, 'SUCCESS')
      }).fail(function(data){
        console.log(data, 'FAIL')
      })
    }

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
    }

    function swipeRight(event){
      event.preventDefault();
      $(this).attr("id", "")
      $(this).addClass('hidden')
      var next_item = $(this).next()
      next_item.removeClass("hidden")
      next_item.attr("id", "swipe")
      $("#swipe").on("swiperight", swipeRight);
      $("#swipe").on("swipeleft", swipeLeft);
    }
  }
});
