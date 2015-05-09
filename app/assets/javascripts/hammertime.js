var el = document.getElementsByClassName('attraction');

// We create a manager object, which is the same as Hammer(), but without the presetted recognizers.
var hammer = new Hammer(el)
var mc = new Hammer.Manager(el);


// Tap recognizer with minimal 2 taps
mc.add( new Hammer.Tap({ event: 'doubletap', taps: 2 }) );
// Single tap recognizer
mc.add( new Hammer.Tap({ event: 'singletap' }) );


// we want to recognize this simulatenous, so a quadrupletap will be detected even while a tap has been recognized.
mc.get('doubletap').recognizeWith('singletap');
// we only want to trigger a tap, when we don't have detected a doubletap
mc.get('singletap').requireFailure('doubletap');


mc.on("singletap doubletap", function(ev) {
    // el.textContent += ev.type +" ";
    console.log('You just did a ' + ev.type)
});
