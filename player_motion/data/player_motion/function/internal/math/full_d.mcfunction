#> player_motion:internal/math/full_d
#d=-(y_unitvector*eyelevel+sqrt(|(d12*12)²-(xz_unitvector*eyelevel)²|))
#
#d=d12*12
    scoreboard players operation $d player_motion.internal.math = $d12 player_motion.internal.math
    scoreboard players operation $d player_motion.internal.math *= #constant.12 player_motion.internal.math
#temp=xz_unitvector*eyelevel
    scoreboard players operation $temp player_motion.internal.math = $xz_unitvector player_motion.internal.math
    scoreboard players operation $temp player_motion.internal.math *= $eyelevel player_motion.internal.math
    scoreboard players operation $temp player_motion.internal.math /= #constant.100 player_motion.internal.math
#d=d²=(d12*12)²
    scoreboard players operation $d player_motion.internal.math /= #constant.10 player_motion.internal.math
    scoreboard players operation $d player_motion.internal.math *= $d player_motion.internal.math
#temp=temp²=(xz_unitvector*eyelevel)²
    scoreboard players operation $temp player_motion.internal.math *= $temp player_motion.internal.math
    scoreboard players operation $temp player_motion.internal.math /= #constant.100 player_motion.internal.math
#d=d-temp=(d12*12)²-(xz_unitvector*eyelevel)²
    scoreboard players operation $d player_motion.internal.math -= $temp player_motion.internal.math
#d=|d|=|(d12*12)²-(xz_unitvector*eyelevel)²|
    execute if score $d player_motion.internal.math matches ..-1 run scoreboard players operation $d player_motion.internal.math *= #constant.-1 player_motion.internal.math
#d=sqrt(d)=sqrt(|(d12*12)²-(xz_unitvector*eyelevel)²|)
    function player_motion:internal/math/d_sqrt
    scoreboard players operation $d player_motion.internal.math = $out player_motion.internal.math.sqrt
    scoreboard players operation $d player_motion.internal.math *= #constant.10 player_motion.internal.math
#temp=y_unitvector*eyelevel
    scoreboard players operation $temp player_motion.internal.math = $y_unitvector player_motion.internal.math
    scoreboard players operation $temp player_motion.internal.math *= $eyelevel player_motion.internal.math
    scoreboard players operation $temp player_motion.internal.math /= #constant.100 player_motion.internal.math
#d=-(d+temp=y_unitvec*eyelevel+sqrt(|(d12*12)²-(xz_unitvector*eyelevel)²|))
    execute store result storage player_motion:math full_d double -0.0001 run scoreboard players operation $d player_motion.internal.math += $temp player_motion.internal.math