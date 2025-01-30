execute if data storage bingo:vars {teamOrange: "orange"} run team join orange
execute if data storage bingo:vars {teamOrange: "orange"} run tellraw @s ["Joined team ",{"text":"orange","color":"gold"},"."]
execute unless data storage bingo:vars {teamOrange: "orange"} run tellraw @s ["Team ",{"text":"orange","color":"gold"}," is currently disabled."]
