# Timestamper
#
# Composed by Matías Dieguez
#
# Timestamper C# library source:
# https://github.com/matiasdieguez/stampery-sharp
#
# Timestamper App source:
# https://github.com/matiasdieguez/everstamp

use_random_seed 2018
use_bpm 89

bass_notes = (ring :b0, :d0, :e1, :d2, :b1, :r, :d2,
              :b1, :r, :d2, :b1, :e2, :d0, :r)

lead_notes = (ring :b2, :d2, :e3, :d4, :b3, :r, :d4,
              :b3, :r, :d4, :b3, :e4, :d2, :r)

live_loop :bass do
  with_fx :reverb, room: 1, mix: 0.5 do
    use_synth :prophet
    play bass_notes.tick,
      cutoff: rrand(90, 130),
      release: 0.8
    sleep 0.5
  end
end

live_loop :lead do
  with_fx :echo do
    sleep 12
    use_synth :supersaw
    14.times do
      play lead_notes.tick,
        cutoff: rrand(90, 130),
        pan: rrand(-1, 1),
        amp: 2
      sleep 0.5
    end
  end
end

live_loop :drums do
  sleep 4
  8.times do
    sample :bd_fat,
      amp: 4,
      pan: rrand(-1, 1)
    sleep 0.5
  end
end