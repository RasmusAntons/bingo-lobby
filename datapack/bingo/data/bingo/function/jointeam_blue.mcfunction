execute if data storage bingo:vars {teamBlue: "blue"} run team join blue
execute if data storage bingo:vars {teamBlue: "blue"} run tellraw @s ["Joined team ",{"text":"blue","color":"blue"},"."]
execute unless data storage bingo:vars {teamBlue: "blue"} run tellraw @s ["Team ",{"text":"blue","color":"blue"}," is currently disabled."]
