#> player_motion:internal/math/full_power
#full_power=sqrt(motion_x²+motion_y²+motion_z²)

scoreboard players operation $x player_motion.internal.math = $motion_x player_motion.internal.math
scoreboard players operation $y player_motion.internal.math = $motion_y player_motion.internal.math
scoreboard players operation $z player_motion.internal.math = $motion_z player_motion.internal.math

# Normalize
execute if score $x player_motion.internal.math matches ..-1 run scoreboard players operation $x player_motion.internal.math *= #constant.-1 player_motion.internal.math
execute if score $y player_motion.internal.math matches ..-1 run scoreboard players operation $y player_motion.internal.math *= #constant.-1 player_motion.internal.math

# SuperSwordTW's method. Credit: https://github.com/SuperSwordTW/Distance-Trig-Calc-3d

execute if score $y player_motion.internal.math matches 0 run scoreboard players operation $y player_motion.internal.math >< $x player_motion.internal.math
execute if score $y player_motion.internal.math matches 0 run scoreboard players operation $y player_motion.internal.math >< $z player_motion.internal.math
execute store result storage player_motion:trig_input x int 1 run scoreboard players get $x player_motion.internal.math
execute store result storage player_motion:trig_input y int 1 run scoreboard players get $y player_motion.internal.math
execute store result storage player_motion:trig_input z int 1 run scoreboard players get $z player_motion.internal.math
function player_motion:internal/math/full_power/trig with storage player_motion:trig_input

scoreboard players operation $power_out player_motion.internal.math /= #constant.10000 player_motion.internal.math

# TODO: Determine why we're storing the result in 3 different scores and whether we can reduce this down
execute \
    store result score $sub_power player_motion.internal.math \
    store result score $n_full_exp player_motion.internal.math \
    store result score $full_power player_motion.internal.math \
    run scoreboard players get $power_out player_motion.internal.math