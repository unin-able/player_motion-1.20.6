#> player_motion:internal/math/d12
#d12=1-sub_power
scoreboard players set $d12 player_motion.internal.math 10000
execute store result score $d player_motion.internal.math run scoreboard players operation $d12 player_motion.internal.math -= $sub_power player_motion.internal.math