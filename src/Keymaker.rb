# Keymaker
#
# Composed by Matías Dieguez
# Random Generation by
# https://github.com/barmassimo/Tiny-Grammar (source code)
# http://massimobarbieri.it/en/SonicPiGenerator (live demo)

use_debug false
use_random_seed 1986
use_bpm 50

song_amp = 8

with_fx :compressor do # global FX
  
  # main live loop start
  live_loop :loop_main do
    sleep 2 # empty loop used for sync
  end
  
  # live loop start
  coff = 80
  live_loop :loop_47393 do
    with_fx :level, amp:song_amp do
      sync :loop_main
      use_random_seed 55461
      16.times do
        sample :bass_dnb_f,
          cutoff_decay: rand(1),
          pan: rrand(-1, 1),
          cutoff: coff
        sleep [0.5, 0.25, 0.125].choose
        print coff
        if coff == 130
          coff = 80
        else
          coff += 1
        end
      end
    end
  end
  
  # live loop start
  live_loop :drums do
    with_fx :level, amp:song_amp do
      sync :loop_main
      16.times do
        sample :bd_haus
        sleep [0.5].choose
      end
      
    end
  end
  
end # global FX
