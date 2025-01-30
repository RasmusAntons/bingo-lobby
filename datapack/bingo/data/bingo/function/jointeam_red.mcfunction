execute if data storage bingo:vars {teamRed: "red"} run team join red
execute if data storage bingo:vars {teamRed: "red"} run tellraw @s ["Joined team ",{"text":"red","color":"red"},"."]
execute unless data storage bingo:vars {teamRed: "red"} run tellraw @s ["Team ",{"text":"red","color":"red"}," is currently disabled."]
