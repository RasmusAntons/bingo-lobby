advancement revoke @a[gamemode=!spectator] everything
function bingo:getteams with storage bingo:vars
execute if score nTeams nTeams matches 1 run function bingo:start_1 with storage bingo:vars
execute if score nTeams nTeams matches 2 run function bingo:start_2 with storage bingo:vars
execute if score nTeams nTeams matches 3 run function bingo:start_3 with storage bingo:vars
execute if score nTeams nTeams matches 4 run function bingo:start_4 with storage bingo:vars
execute if score nTeams nTeams matches 5 run function bingo:start_5 with storage bingo:vars
execute if score nTeams nTeams matches 6 run function bingo:start_6 with storage bingo:vars
execute if score nTeams nTeams matches 7 run function bingo:start_7 with storage bingo:vars
execute if score nTeams nTeams matches 8 run function bingo:start_8 with storage bingo:vars
execute if score nTeams nTeams matches 9 run function bingo:start_9 with storage bingo:vars
$execute if predicate bingo:$(consistent) store result storage bingo:run seedfind_success byte 1 run bingospreadplayers4d 0 0 500 @a[gamemode=!spectator] #bingo:excluded
$execute unless predicate bingo:$(consistent) in minecraft:overworld store result storage bingo:run seedfind_success byte 1 run bingospreadplayersseedfind $(spawndistance) 5 $(biomeproximity) $(respect_teams) @a[gamemode=!spectator] $(samebiome) $(dimension) #bingo:excluded
execute if data storage bingo:run {seedfind_success:1b} run function bingo:setup_spawn with storage bingo:storage root
execute if data storage bingo:run {seedfind_success:0b} run tellraw @a {text:"Failed to find a suitable seed", color:"red"}
execute if data storage bingo:run {seedfind_success:0b} run bingo reset
