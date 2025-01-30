execute if block ~ ~2 ~ minecraft:black_wool run data merge storage bingo:vars {teamBlack: ""}
execute unless block ~ ~2 ~ minecraft:black_wool run data merge storage bingo:vars {teamBlack: "black"}
execute if data storage bingo:vars {teamBlack: "black"} run setblock ~ ~2 ~ minecraft:black_wool
execute unless data storage bingo:vars {teamBlack: "black"} run setblock ~ ~2 ~ minecraft:stripped_dark_oak_wood
execute unless data storage bingo:vars {teamBlack: "black"} run tellraw @a[team=black] ["Team ",{"text":"black","color":"black"}," was disabled and you have been removed from it."]
execute unless data storage bingo:vars {teamBlack: "black"} run playsound minecraft:block.note_block.bell master @a[team=black]
execute unless data storage bingo:vars {teamBlack: "black"} run team leave @a[team=black]
