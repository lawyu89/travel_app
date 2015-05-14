$( document).ready(function() {
  if ($('.hidden').length > 0){
    var current = $('.hidden').first()
    current.attr("id", "swipe")
    current.removeClass("hidden")
    current.addClass('current-button')
    if (current.attr('class').indexOf('swipsee-end') === -1) {
      $("#swipe").on("swipeleft", function(e){
        $('#swipe').animate({
          right: '200px'
        }).fadeOut('fast',function(){
          swipeLeft(e, current)
        })
        runDislike($(this).find('.button-left'))
      });
      $("#swipe").on("swiperight", function(e){
        $('#swipe').animate({
          left: '200px'
        }).fadeOut('fast',function(){
          swipeRight(e, current)
        })
        runLike($(this).find('.button-right'))
      });
    }
    $(".attractions-container").on("tap", '#swipe img',function(event){
      event.preventDefault()
      $(this).closest('.attraction').toggleClass('flip')
    });

    $(".attractions-container").on("tap", '.back',function(event){
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
      // debugger
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
      event.preventDefault();
      parent.attr("id", "")
      parent.slideUp('fast', function(){
        $(this).addClass('hidden')
      })
      parent.removeClass('current-button')
      var next_item = parent.next()
      next_item.attr("id", "swipe")
      next_item.removeClass("hidden")
      next_item.addClass('current-button')
      if (next_item.attr('class').indexOf('swipsee-end') === -1) {
        $("#swipe").on("swipeleft", function(e){
          $('#swipe').animate({
          right: '200px'
        }).fadeOut('fast',function(){
          swipeLeft(e,next_item)
        })
          runDislike(next_item.find('.button-left'))
        });
        $("#swipe").on("swiperight", function(e){
          $('#swipe').animate({
            left: '200px'
          }).fadeOut('fast',function(){
            swipeRight(e,next_item)
          })
          runLike(next_item.find('.button-right'))
        });
      }
    }

    function swipeRight(event, parent){
      event.preventDefault();
      parent.attr("id", "")
      parent.slideUp('fast', function(){
        $(this).addClass('hidden')
      })
      parent.removeClass('current-button')
      var next_item = parent.next()
      next_item.removeClass("hidden")
      next_item.attr("id", "swipe")
      next_item.addClass('current-button')
      if (next_item.attr('class').indexOf('swipsee-end') === -1) {
        $("#swipe").on("swiperight", function(e){
          $('#swipe').animate({
            left: '200px'
          }).fadeOut('fast',function(){
            swipeRight(e,next_item)
          })
          runDislike(next_item.find('.button-left'))
        });
        $("#swipe").on("swipeleft", function(e){
          $('#swipe').animate({
            right: '200px'
          }).fadeOut('fast',function(){
            swipeLeft(e,next_item)
          })
          runLike(next_item.find('.button-right'))
        });
      }
    }
  }

  $('.total-page-container').on('click', '.unlike', function(e){
    e.preventDefault();
    var url = $(this).attr('href')

    $.ajax({
      dataType: 'json',
      url: url,
      type: 'delete'
    }).done(function(response){
      console.log('AJAX SUCCEEDED')
      var el = document.getElementById(response.name)
      var upperDiv = el.parentElement.parentElement.parentElement
      $(upperDiv).remove()
      if ( $('.attra-wrapper').children().length === 0 ) {
        window.location.replace("http://localhost:3000/");
      }
    }).fail(function(response){
      console.log('AJAX FAILED')
      console.log(response)
    })
  })
});
