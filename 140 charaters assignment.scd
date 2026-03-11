{GVerb.ar(Pan2.ar(RLPF.ar(Saw.ar(45,0.12),LFNoise1.ar(0.08).exprange(80,1200),0.5),SinOsc.ar(0.03)*0.2),90,14,0.6,0.9,15,0,1,1)
}.play



s.makeWindow;

s.meter;

s.scope;

s.freqscope; 