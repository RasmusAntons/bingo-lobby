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
execute at @r[gamemode=!spectator] run bingogamerule playertracker:give_player_tracker true
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