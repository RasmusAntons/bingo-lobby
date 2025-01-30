execute if data storage bingo:vars {teamGreen: "green"} run team join green
execute if data storage bingo:vars {teamGreen: "green"} run tellraw @s ["Joined team ",{"text":"green","color":"green"},"."]
execute unless data storage bingo:vars {teamGreen: "green"} run tellraw @s ["Team ",{"text":"green","color":"green"}," is currently disabled."]
