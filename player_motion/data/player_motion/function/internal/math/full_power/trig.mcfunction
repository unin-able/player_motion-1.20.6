$execute in minecraft:overworld positioned 0.5 0.0 0.5 facing -$(x) -$(y) $(z) run tp d4bd74a7-4e82-4a07-8850-dfc4d89f9e2f ~ ~ ~ ~ ~
execute store result storage player_motion:trig_input t int 1 run data get entity d4bd74a7-4e82-4a07-8850-dfc4d89f9e2f Rotation[1] 100
function player_motion:internal/math/full_power/sine with storage player_motion:trig_input