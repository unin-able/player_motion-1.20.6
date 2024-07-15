#> player_motion:api/launch_looking
#   Launches the player in the input direction
#
# Inputs:
#   execute rotated <desired direction>
#   score $strength player_motion.api.launch       <<< Strength to launch in looking direction (scaled up by 10000)
#
# Outputs
#   player is launched in the looking direction of the command with the desired strength

#Flag indicating that players need to be launched, tag the player to be launched
scoreboard players set $function_called player_motion.internal.dummy 1
tag @s add player_motion.launch

execute store result storage player_motion:math motion[0] double 0.0001 run scoreboard players get @s player_motion.internal.motion.x
execute store result storage player_motion:math motion[1] double 0.0001 run scoreboard players get @s player_motion.internal.motion.y
execute store result storage player_motion:math motion[2] double 0.0001 run scoreboard players get @s player_motion.internal.motion.z

execute store result storage player_motion:input strength float 0.0001 run scoreboard players get $strength player_motion.api.launch

execute as d59ee2c6-58c8-4885-b9db-ecff066e4439 positioned 0.0 0.0 0.0 run function player_motion:internal/math/looking_to_xyz with storage player_motion:input

execute store result score $out player_motion.internal.motion.x run data get storage player_motion:math motion[0] 10000
execute store result score $out player_motion.internal.motion.y run data get storage player_motion:math motion[1] 10000
execute store result score $out player_motion.internal.motion.z run data get storage player_motion:math motion[2] 10000

scoreboard players operation @s player_motion.internal.motion.x += $out player_motion.internal.motion.x
scoreboard players operation @s player_motion.internal.motion.y += $out player_motion.internal.motion.y
scoreboard players operation @s player_motion.internal.motion.z += $out player_motion.internal.motion.z