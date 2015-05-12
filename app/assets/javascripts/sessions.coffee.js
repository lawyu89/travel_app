//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/
// $(document).ready(function(){
//   FB.init({
//     appId: '1441097006185279',
//     version: 'v2.3' // or v2.0, v2.1, v2.0
//   })

//   (function(d, s, id) {
//     var js, fjs = d.getElementsByTagName(s)[0];
//     if (d.getElementById(id)) return;
//     js = d.createElement(s); js.id = id;
//     js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.3&appId=1441097006185279";
//     fjs.parentNode.insertBefore(js, fjs);
//   }(document, 'script', 'facebook-jssdk'));
// })

$(document).ready(function() {
  (function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.3&appId=1441097006185279";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
  $.ajaxSetup({ cache: true });
  $.getScript('//connect.facebook.net/en_US/sdk.js', function(){
    FB.init({
      appId: '1441097006185279',
      version: 'v2.3' // or v2.0, v2.1, v2.0
    });
    $('#loginbutton,#feedbutton').removeAttr('disabled');
    FB.getLoginStatus(updateStatusCallback);
  });
});