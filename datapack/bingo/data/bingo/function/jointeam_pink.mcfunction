execute if data storage bingo:vars {teamPink: "pink"} run team join pink
execute if data storage bingo:vars {teamPink: "pink"} run tellraw @s ["Joined team ",{"text":"pink","color":"light_purple"},"."]
execute unless data storage bingo:vars {teamPink: "pink"} run tellraw @s ["Team ",{"text":"pink","color":"light_purple"}," is currently disabled."]
