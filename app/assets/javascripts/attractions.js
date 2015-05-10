$( document ).ready(function() {
  $('body').on('click', '.hidden',function(event){
    event.preventDefault();
  })
  if ($('.hidden').length > 0){
    var current = $('.hidden').first()
    current.attr('class', "front")
    current.css("display", "inline")
    current.attr("id", "swipe")
    $("#swipe").on("swipeleft", swipeLeft);
    $("#swipe").on("swiperight", swipeRight);
    $("#swipe").on("tap", findDescription);

    function findDescription(event) {
      event.preventDefault()
      var url = $(this).find('a').attr('href')
      var current = $(this)
      $.ajax({
        url: url,
        type: 'get',
        dataType: 'json',
      }).done(function(data){
        displayDescription(data, current)
      })
    }

    function displayDescription(response, current){
      var template = $("#desc-template");
      var a_html = Mustache.to_html(template.html(), response);
      $(".attractions-container").append(a_html);
      current.flip({
        direction:'tb',
        content: 'test'
      })
    }

  // Callback function references the event target and adds the 'swipe' class to it
    function swipeLeft(event){
      event.preventDefault();
      $(this).css("display", "none")
      $(this).attr("id", "")
      $(this).attr("class", "")
      var next_item = $(this).next()
      next_item.css("display", "inline")
      next_item.attr("id", "swipe")
      next_item.attr("class", "front")
      $("#swipe").on("swipeleft", swipeLeft);
      $("#swipe").on("swiperight", swipeRight);
      $("#swipe").on("tap", findDescription);

      var response = $.ajax({
        type: 'POST',
        url: $(this).find('a').attr('href')+'/dislike',
        dataType: 'json'
      })

      response.done(function(data){
        console.log('AJAX SUCCEEDED')
        console.log(data)
      })

      response.fail(function(data){
        console.log('AJAX FAILED FUCK')
        console.log(data)
      })
    }

    function swipeRight(event){
      event.preventDefault();
      $(this).css("display", "none")
      $(this).attr("id", "")
      var next_item = $(this).next()
      next_item.css("display", "inline")
      next_item.attr("id", "swipe")
      $("#swipe").on("swiperight", swipeRight);
      $("#swipe").on("swipeleft", swipeLeft);
      $("#swipe").on("tap", findDescription);
      var response = $.ajax({
        type: 'POST',
        url: $(this).attr('href')+'/like',
        dataType: 'json'
      })

      response.done(function(data){
        console.log('AJAX SUCCEEDED')
        console.log(data)
      })

      response.fail(function(data){
        console.log('AJAX FAILED FUCK')
        console.log(data)
      })
    }
  }
});
