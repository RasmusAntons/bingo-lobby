execute if data storage bingo:vars {teamPurple: "purple"} run team join purple
execute if data storage bingo:vars {teamPurple: "purple"} run tellraw @s ["Joined team ",{"text":"purple","color":"dark_purple"},"."]
execute unless data storage bingo:vars {teamPurple: "purple"} run tellraw @s ["Team ",{"text":"purple","color":"dark_purple"}," is currently disabled."]
