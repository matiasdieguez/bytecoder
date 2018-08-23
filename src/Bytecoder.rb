# Bytecoder
#
# Composed by Matías Dieguez
# Random Generation by
# https://github.com/barmassimo/Tiny-Grammar (source code)
# http://massimobarbieri.it/en/SonicPiGenerator (live demo)

use_bpm 40
bass = (ring :e, :r, :r, :d, :e1, :r, :e, :r)

with_fx :reverb, room: 1, mix: 0.3 do
  live_loop :bizet do
    with_fx :slicer, phase: 0.125 do
      synth :blade, note: :e2, release: 8,
        cutoff: 100, amp: 1.5, pan: rrand(-1, 1), amp: 8
    end
    16.times do
      tick
      use_synth :prophet
      play bass.look - 24, release: 0.3
      sleep 0.125
    end
  end
end

live_loop :ind do
  sample :loop_industrial, beat_stretch: 1,
    cutoff: 100, rate: 1, amp: 4
  sleep 1
end

live_loop :drums do
  sample :bd_haus, cutoff: 110
  synth :prophet, note: :e1, attack: 0,
    release: 0.1, amp: 8
  sleep 0.5
end