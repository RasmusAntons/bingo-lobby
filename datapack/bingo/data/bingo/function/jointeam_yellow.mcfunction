execute if data storage bingo:vars {teamYellow: "yellow"} run team join yellow
execute if data storage bingo:vars {teamYellow: "yellow"} run tellraw @s ["Joined team ",{"text":"yellow","color":"yellow"},"."]
execute unless data storage bingo:vars {teamYellow: "yellow"} run tellraw @s ["Team ",{"text":"yellow","color":"yellow"}," is currently disabled."]
