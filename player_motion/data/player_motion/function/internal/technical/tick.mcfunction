#> player_motion:internal/technical/tick
#   Commands run per tick, within a scheduling loop to ensure they're run after any tick.json functions

schedule function player_motion:internal/technical/tick 1t append

#LAUNCH PLAYERS
execute if score $function_called player_motion.internal.dummy matches 1 as @a[tag=player_motion.launch] at @s run function player_motion:internal/launch/main
