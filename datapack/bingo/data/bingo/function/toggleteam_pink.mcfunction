execute if block ~ ~2 ~ minecraft:pink_wool run data merge storage bingo:vars {teamPink: ""}
execute unless block ~ ~2 ~ minecraft:pink_wool run data merge storage bingo:vars {teamPink: "pink"}
execute if data storage bingo:vars {teamPink: "pink"} run setblock ~ ~2 ~ minecraft:pink_wool
execute unless data storage bingo:vars {teamPink: "pink"} run setblock ~ ~2 ~ minecraft:stripped_dark_oak_wood
execute unless data storage bingo:vars {teamPink: "pink"} run tellraw @a[team=pink] ["Team ",{"text":"pink","color":"light_purple"}," was disabled and you have been removed from it."]
execute unless data storage bingo:vars {teamPink: "pink"} run playsound minecraft:block.note_block.bell master @a[team=pink]
execute unless data storage bingo:vars {teamPink: "pink"} run team leave @a[team=pink]
