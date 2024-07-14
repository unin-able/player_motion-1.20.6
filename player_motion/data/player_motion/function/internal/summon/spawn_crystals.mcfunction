#> player_motion:internal/summon/spawn_crystals
$execute if score $n_full_exp player_motion.internal.math matches 1.. anchored eyes positioned ^ ^ ^$(full_d) run function player_motion:internal/summon/spawn_full_crystal
$execute anchored eyes positioned ^ ^ ^$(d) summon end_crystal run damage @s 0