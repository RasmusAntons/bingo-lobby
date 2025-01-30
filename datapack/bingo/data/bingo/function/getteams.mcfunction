data modify storage bingo:vars teams set value []
scoreboard players set nTeams nTeams 0
execute if data storage bingo:vars {teamRed: "red"} run scoreboard players add nTeams nTeams 1
execute if data storage bingo:vars {teamRed: "red"} run data modify storage bingo:vars teams append value "red"
execute if data storage bingo:vars {teamOrange: "orange"} run scoreboard players add nTeams nTeams 1
execute if data storage bingo:vars {teamOrange: "orange"} run data modify storage bingo:vars teams append value "orange"
execute if data storage bingo:vars {teamGreen: "green"} run scoreboard players add nTeams nTeams 1
execute if data storage bingo:vars {teamGreen: "green"} run data modify storage bingo:vars teams append value "green"
execute if data storage bingo:vars {teamBlue: "blue"} run scoreboard players add nTeams nTeams 1
execute if data storage bingo:vars {teamBlue: "blue"} run data modify storage bingo:vars teams append value "blue"
execute if data storage bingo:vars {teamYellow: "yellow"} run scoreboard players add nTeams nTeams 1
execute if data storage bingo:vars {teamYellow: "yellow"} run data modify storage bingo:vars teams append value "yellow"
execute if data storage bingo:vars {teamPink: "pink"} run scoreboard players add nTeams nTeams 1
execute if data storage bingo:vars {teamPink: "pink"} run data modify storage bingo:vars teams append value "pink"
execute if data storage bingo:vars {teamPurple: "purple"} run scoreboard players add nTeams nTeams 1
execute if data storage bingo:vars {teamPurple: "purple"} run data modify storage bingo:vars teams append value "purple"
execute if data storage bingo:vars {teamBlack: "black"} run scoreboard players add nTeams nTeams 1
execute if data storage bingo:vars {teamBlack: "black"} run data modify storage bingo:vars teams append value "black"
execute if data storage bingo:vars {teamWhite: "white"} run scoreboard players add nTeams nTeams 1
execute if data storage bingo:vars {teamWhite: "white"} run data modify storage bingo:vars teams append value "white"
execute if score nTeams nTeams matches 1..9 run data modify storage bingo:vars team1 set from storage bingo:vars teams[0]
execute if score nTeams nTeams matches 2..9 run data modify storage bingo:vars team2 set from storage bingo:vars teams[1]
execute if score nTeams nTeams matches 3..9 run data modify storage bingo:vars team3 set from storage bingo:vars teams[2]
execute if score nTeams nTeams matches 4..9 run data modify storage bingo:vars team4 set from storage bingo:vars teams[3]
execute if score nTeams nTeams matches 5..9 run data modify storage bingo:vars team5 set from storage bingo:vars teams[4]
execute if score nTeams nTeams matches 6..9 run data modify storage bingo:vars team6 set from storage bingo:vars teams[5]
execute if score nTeams nTeams matches 7..9 run data modify storage bingo:vars team7 set from storage bingo:vars teams[6]
execute if score nTeams nTeams matches 8..9 run data modify storage bingo:vars team8 set from storage bingo:vars teams[7]
execute if score nTeams nTeams matches 9..9 run data modify storage bingo:vars team9 set from storage bingo:vars teams[8]
