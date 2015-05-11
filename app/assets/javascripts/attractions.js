$( document).ready(function() {
  if ($('.hidden').length > 0){
    var current = $('.hidden').first()
    current.attr("id", "swipe")
    current.removeClass("hidden")
    current.addClass('current-button')
    $("#swipe").on("swipeleft", function(e){
      swipeLeft(e, current)
    });
    $("#swipe").on("swiperight", function(e){
      swipeRight(e, current)
    });
    $(".attractions-container").on("tap", '#swipe img,h1',function(event){
      event.preventDefault()
      $(this).closest('.attraction').toggleClass('flip')
    });


    $('.attractions-container').on('tap', '.current-button #leftb', function(e){
      var button = this
      e.preventDefault();
      runDislike(button);
      swipeLeft(e, $(this).closest('.attraction'))

    })
    $('.attractions-container').on('tap', '.current-button #rightb', function(e){
      var button = this
      e.preventDefault();
      runLike(button);
      swipeRight(e, $(this).closest('.attraction'))
    })
    $('.attractions-container').on('tap', '.current-button #midb', function(e){
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
    function swipeLeft(event, parent){
      console.log(parent)
      event.preventDefault();
      parent.attr("id", "")
      parent.addClass("hidden")
      parent.removeClass('current-button')
      var next_item = parent.next()
      next_item.attr("id", "swipe")
      next_item.removeClass("hidden")
      next_item.addClass('current-button')
      $("#swipe").on("swipeleft", function(e){
        swipeLeft(e,next_item)
      });
      $("#swipe").on("swiperight", function(e){
        swipeRight(e,next_item)
      });
    }

    function swipeRight(event, parent){
      event.preventDefault();
      parent.attr("id", "")
      parent.addClass('hidden')
      parent.removeClass('current-button')
      var next_item = parent.next()
      next_item.removeClass("hidden")
      next_item.attr("id", "swipe")
      next_item.addClass('current-button')
      $("#swipe").on("swiperight", function(e){
        swipeRight(e,next_item)
      });
      $("#swipe").on("swipeleft", function(e){
        swipeLeft(e,next_item)
      });
    }
  }
});
