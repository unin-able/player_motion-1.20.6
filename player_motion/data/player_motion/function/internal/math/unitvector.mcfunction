#> player_motion:internal/math/unitvector
data modify entity @s Pos set from storage player_motion:math motion
execute at @s positioned 0.0 0.0 0.0 facing entity @s feet run tp ^ ^ ^1
data modify storage player_motion:math unitvector set from entity @s Pos
execute store result score $y_unitvector player_motion.internal.math run data get storage player_motion:math unitvector[1] 10000
# I don't really understand why I needed to add this when nedraw's code didn't have it, but this makes it work
execute if score $motion_y player_motion.internal.math matches ..-1 run scoreboard players operation $y_unitvector player_motion.internal.math *= #constant.-1 player_motion.internal.math
tp @s 0.0 0.0 0.0