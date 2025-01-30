execute if data storage bingo:vars {teamWhite: "white"} run team join white
execute if data storage bingo:vars {teamWhite: "white"} run tellraw @s ["Joined team ",{"text":"white","color":"white"},"."]
execute unless data storage bingo:vars {teamWhite: "white"} run tellraw @s ["Team ",{"text":"white","color":"white"}," is currently disabled."]
