execute if block ~ ~2 ~ minecraft:white_wool run data merge storage bingo:vars {teamWhite: ""}
execute unless block ~ ~2 ~ minecraft:white_wool run data merge storage bingo:vars {teamWhite: "white"}
execute if data storage bingo:vars {teamWhite: "white"} run setblock ~ ~2 ~ minecraft:white_wool
execute unless data storage bingo:vars {teamWhite: "white"} run setblock ~ ~2 ~ minecraft:stripped_dark_oak_wood
execute unless data storage bingo:vars {teamWhite: "white"} run tellraw @a[team=white] ["Team ",{"text":"white","color":"white"}," was disabled and you have been removed from it."]
execute unless data storage bingo:vars {teamWhite: "white"} run playsound minecraft:block.note_block.bell master @a[team=white]
execute unless data storage bingo:vars {teamWhite: "white"} run team leave @a[team=white]
