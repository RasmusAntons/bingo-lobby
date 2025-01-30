execute if data storage bingo:vars {teamBlack: "black"} run team join black
execute if data storage bingo:vars {teamBlack: "black"} run tellraw @s ["Joined team ",{"text":"black","color":"black"},"."]
execute unless data storage bingo:vars {teamBlack: "black"} run tellraw @s ["Team ",{"text":"black","color":"black"}," is currently disabled."]
