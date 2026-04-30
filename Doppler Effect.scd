(
s.waitForBoot({

    x = {
        var rumble, drone, hiss, metal, ghost, sig, pan, rev;


        rumble = LPF.ar(BrownNoise.ar(0.25), 40)
               + LPF.ar(Crackle.ar(1.92, 0.08), 55);

        drone = Mix.fill(4, {
            |i|
            var freqs = [20, 27, 31, 38];
            var detune = LFNoise1.kr(0.03).range(0.985, 1.015);
            SinOsc.ar(freqs[i] * detune, 0, 0.06)
        });


        ghost = BPF.ar(
            PinkNoise.ar(0.05),
            LFNoise1.kr(0.08).exprange(200, 1200),
            0.08
        ) * LFNoise1.kr(0.05).range(0.2, 1.0);


        hiss = HPF.ar(GrayNoise.ar(0.025), 2500)
             * LFNoise1.kr(0.06).range(0.1, 0.8);

        metal = Ringz.ar(
    Dust.ar(0.7) * 0.5,
    LFNoise1.kr(0.25).exprange(250, 3000),
    4
) * 0.28;

        sig = rumble + drone + ghost + hiss + metal;

        sig = LPF.ar(sig, LFNoise1.kr(0.04).exprange(250, 1600));
        sig = HPF.ar(sig, 22); // sounds like breathing

        pan = SinOsc.kr(0.006) + (LFNoise1.kr(0.015) * 0.4);
        pan = pan.clip(-1, 1); //Range, Avoid clip

        sig = Pan2.ar(sig, pan, 0.75);


        rev = FreeVerb2.ar(sig[0], sig[1], 0.65, 0.95, 0.25);


        (rev * 0.8) + (sig * 0.35); //mix
    }.play;

});
)


x.release(5);  