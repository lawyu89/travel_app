$(document).ready(function(){
  var myElement = $('#attraction0');

// We create a manager object, which is the same as Hammer(), but without the presetted recognizers.
  var mc = new Hammer.Manager(myElement);
//
// // Default, tap recognizer
// mc.add( new Hammer.Tap() );
//
// // Tap recognizer with minimal 4 taps
// mc.add( new Hammer.Tap({ event: 'quadrupletap', taps: 4 }) );
//
// // we want to recognize this simulatenous, so a quadrupletap will be detected even while a tap has been recognized.
// // the tap event will be emitted on every tap
// mc.get('quadrupletap').recognizeWith('tap');
//
//
// mc.on("tap quadrupletap", function(ev) {
//     myElement.textContent += ev.type +" ";
// });
})
