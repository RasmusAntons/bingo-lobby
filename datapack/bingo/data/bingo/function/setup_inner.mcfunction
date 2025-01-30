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
$execute if predicate bingo:$(consistent) run bingospreadplayers4d 0 0 500 @a[gamemode=!spectator] #bingo:excluded
$execute unless predicate bingo:$(consistent) in minecraft:overworld run bingospreadplayersseedfind $(spawndistance) 5 $(biomeproximity) $(respect_teams) @a[gamemode=!spectator] $(samebiome) #bingo:excluded
execute as @a[gamemode=!spectator] run clearspawnpoint
$execute if data storage bingo:vars {teamWhite: "white"} at @p[gamemode=!spectator,team=thite] run function bingo:init_team {team: "white", bonus_chest: "$(bonus_chest)", seed: $(seed), consistent: "$(consistent)"}
$execute if data storage bingo:vars {teamRed: "red"} at @p[gamemode=!spectator,team=red] run function bingo:init_team {team: "red", bonus_chest: "$(bonus_chest)", seed: $(seed), consistent: "$(consistent)"}
$execute if data storage bingo:vars {teamOrange: "orange"} at @p[gamemode=!spectator,team=orange] run function bingo:init_team {team: "orange", bonus_chest: "$(bonus_chest)", seed: $(seed), consistent: "$(consistent)"}
$execute if data storage bingo:vars {teamGreen: "green"} at @p[gamemode=!spectator,team=green] run function bingo:init_team {team: "green", bonus_chest: "$(bonus_chest)", seed: $(seed), consistent: "$(consistent)"}
$execute if data storage bingo:vars {teamBlue: "blue"} at @p[gamemode=!spectator,team=blue] run function bingo:init_team {team: "blue", bonus_chest: "$(bonus_chest)", seed: $(seed), consistent: "$(consistent)"}
$execute if data storage bingo:vars {teamYellow: "yellow"} at @p[gamemode=!spectator,team=yellow] run function bingo:init_team {team: "yellow", bonus_chest: "$(bonus_chest)", seed: $(seed), consistent: "$(consistent)"}
$execute if data storage bingo:vars {teamPink: "pink"} at @p[gamemode=!spectator,team=pink] run function bingo:init_team {team: "pink", bonus_chest: "$(bonus_chest)", seed: $(seed), consistent: "$(consistent)"}
$execute if data storage bingo:vars {teamPurple: "purple"} at @p[gamemode=!spectator,team=purple] run function bingo:init_team {team: "purple", bonus_chest: "$(bonus_chest)", seed: $(seed), consistent: "$(consistent)"}
$execute if data storage bingo:vars {teamBlack: "black"} at @p[gamemode=!spectator,team=black] run function bingo:init_team {team: "black", bonus_chest: "$(bonus_chest)", seed: $(seed), consistent: "$(consistent)"}
$execute if data storage bingo:vars {teamWhite: "white"} at @p[gamemode=!spectator,team=white] run function bingo:init_team {team: "white", bonus_chest: "$(bonus_chest)", seed: $(seed), consistent: "$(consistent)"}
function bingo:freezeplayers with storage bingo:vars
execute at @r[gamemode=!spectator] run bingogamerule givePlayerTracker true
clear @a[gamemode=!spectator]
xp set @a[gamemode=!spectator] 0
xp set @a[gamemode=!spectator] 0 levels
effect clear @a[gamemode=!spectator]
gamemode survival @a[gamemode=!spectator]
advancement revoke @a[gamemode=!spectator] everything
setentityval health @a[gamemode=!spectator] 20
setentityval food @a[gamemode=!spectator] 20
setentityval saturation @a[gamemode=!spectator] 5
setentityval exhaustion @a[gamemode=!spectator] 0
setstat @a[gamemode=!spectator] custom minecraft:time_since_rest 0
