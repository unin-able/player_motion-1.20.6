#> player_motion:api/launch_xyz
#   Launches the player in the input direction
#
# Inputs:
#   executed as player at player's position
#   score $x player_motion.api.launch       <<< Strength to launch in x direction
#   score $y player_motion.api.launch       <<< Strength to launch in y direction
#   score $z player_motion.api.launch       <<< Strength to launch in z direction
#
# Outputs
#   player is launched in the specified direction

#Flag indicating that players need to be launched, tag the player to be launched
scoreboard players set $function_called player_motion.internal.dummy 1
tag @s add player_motion.launch

execute store result storage player_motion:math motion[0] int 1 run \
    scoreboard players get $x player_motion.api.launch
execute store result storage player_motion:math motion[1] int 1 run \
    scoreboard players get $y player_motion.api.launch
execute store result storage player_motion:math motion[2] int 1 run \
    scoreboard players get $z player_motion.api.launch

scoreboard players operation $x player_motion.api.launch *= #constant.10000 player_motion.internal.math
scoreboard players operation $y player_motion.api.launch *= #constant.10000 player_motion.internal.math
scoreboard players operation $z player_motion.api.launch *= #constant.10000 player_motion.internal.math

scoreboard players operation @s player_motion.internal.motion.x += $x player_motion.api.launch
scoreboard players operation @s player_motion.internal.motion.y += $y player_motion.api.launch
scoreboard players operation @s player_motion.internal.motion.z += $z player_motion.api.launch