#> player_motion:internal/math/xz_unitvector/v


scoreboard players operation $tdx player_motion.internal.math = $x_unitvector player_motion.internal.math
scoreboard players operation $tdx player_motion.internal.math *= #constant.100 player_motion.internal.const
scoreboard players operation $tdx player_motion.internal.math /= $z_unitvector player_motion.internal.math

execute if score $z_unitvector player_motion.internal.math matches 0 run return run scoreboard players set $temp player_motion.internal.math 1000
execute if score $tdx player_motion.internal.math matches 2301.. run return run scoreboard players set $temp player_motion.internal.math 999
#> if the value is too big, angle = around 90

execute store result storage player_motion:math magnitude.tan int 1 run scoreboard players get $tdx player_motion.internal.math
function player_motion:internal/math/xz_unitvector/v_table with storage player_motion:math magnitude