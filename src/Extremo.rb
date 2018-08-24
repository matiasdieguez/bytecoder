# Extremo
#
# Composed by Matías Dieguez

use_random_seed 20180808
use_bpm 70

live_loop :extremo_dark do
  sleep 12
  with_fx :reverb do
    with_fx :slicer, phase: 0.25 do
      synth :dpulse,
        note: :g1,
        release: 2,
        cutoff: 120,
        amp: 2
    end
  end
end

riffCuttOff = 80
live_loop :riff do
  with_fx :reverb do
    print riffCuttOff
    use_synth :prophet
    riff = (ring :g0, :r, :a1, :g3)
    play riff.tick,
      release: 0.8,
      cutoff: riffCuttOff
    sleep 0.25
  end
  
  if riffCuttOff == 100
    riffCuttOff = 80
  else
    riffCuttOff += 1
  end
end

live_loop :extreme_saws do
  use_synth :tech_saws
  play :g1,
    cutoff: rrand(50, 90),
    pan: rrand(-1, 1),
    amp: 4
  sleep 0.5
end

live_loop :extreme_bass do
  use_synth :prophet
  use_debug false
  
  with_fx :reverb, room: 0.8 do
    sleep 18
    live_loop :extreme_scanner do
      with_fx :slicer, phase: 0.25, amp: 1.5 do
        co = (line 80, 128, steps: 8).tick
        play :g1,
          cutoff: co,
          release: 8,
          attack: 1,
          cutoff_attack: 8,
          cutoff_release: 4
        sleep 8
      end
    end
    
    live_loop :extreme_squel do
      use_random_seed 8
      16.times do
        n = (ring :g1, :g2, :g3).tick
        play n, release: 0.125,
          cutoff: rrand(70, 130),
          res: 0.9,
          wave: 1,
          amp: 0.8
        sleep 0.125
      end
    end
  end
end
