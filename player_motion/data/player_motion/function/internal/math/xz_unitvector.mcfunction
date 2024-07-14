#> player_motion:internal/math/xz_unitvector

execute store result score $unitvextor.x player_motion.internal.math run data get storage player_motion:math xz_unitvector.x 10000
execute store result score $unitvextor.z player_motion.internal.math run data get storage player_motion:math xz_unitvector.z 10000

# Normalize
execute if score $unitvextor.x player_motion.internal.math matches ..-1 run \
    scoreboard players operation $unitvextor.x player_motion.internal.math *= #constant.-1 player_motion.internal.math
execute if score $unitvextor.x player_motion.internal.math matches ..-1 run \
    scoreboard players operation $unitvextor.x player_motion.internal.math *= #constant.-1 player_motion.internal.math

# SuperSwordTW's method. Credit: https://github.com/SuperSwordTW/Distance-Trig-Calc-2d

execute if score $unitvextor.z player_motion.internal.math > $unitvextor.x player_motion.internal.math \
    run scoreboard players operation $unitvextor.z player_motion.internal.math >< $unitvextor.x player_motion.internal.math

execute store result storage player_motion:trig_input x int 1 run scoreboard players get $unitvextor.x player_motion.internal.math

scoreboard players operation $unitvextor.t player_motion.internal.math = $unitvextor.x player_motion.internal.math
scoreboard players operation $unitvextor.t player_motion.internal.math *= #constant.100 player_motion.internal.math
scoreboard players operation $unitvextor.t player_motion.internal.math /= $unitvextor.z player_motion.internal.math

execute if score $unitvextor.z player_motion.internal.math matches 0 run \
    return run scoreboard players operation $xz_unitvector player_motion.internal.math = $unitvextor.x player_motion.internal.math

# TODO: Determine what this was for
# execute if score $unitvextor.t player_motion.internal.math matches 2301.. run return run scoreboard players set .sine distance 1000

execute store result storage player_motion:trig_input tan int 1 run scoreboard players get $unitvextor.t player_motion.internal.math

function player_motion:internal/math/xz_unitvector/v_table with storage player_motion:trig_input

scoreboard players operation $xz_unitvector player_motion.internal.math /= #constant.10000 player_motion.internal.math