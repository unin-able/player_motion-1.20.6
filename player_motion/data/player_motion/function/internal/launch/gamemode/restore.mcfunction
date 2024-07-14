#> player_motion:internal/launch/gamemode/restore
execute if score gamemode player_motion.internal.store matches 0 run return run gamemode survival @s
execute if score gamemode player_motion.internal.store matches 1 run return run gamemode creative @s
execute if score gamemode player_motion.internal.store matches 2 run return run gamemode adventure @s
execute if score gamemode player_motion.internal.store matches 3 run gamemode spectator @s
