execute if block ~ ~2 ~ minecraft:blue_wool run data merge storage bingo:vars {teamBlue: ""}
execute unless block ~ ~2 ~ minecraft:blue_wool run data merge storage bingo:vars {teamBlue: "blue"}
execute if data storage bingo:vars {teamBlue: "blue"} run setblock ~ ~2 ~ minecraft:blue_wool
execute unless data storage bingo:vars {teamBlue: "blue"} run setblock ~ ~2 ~ minecraft:stripped_dark_oak_wood
execute unless data storage bingo:vars {teamBlue: "blue"} run tellraw @a[team=blue] ["Team ",{"text":"blue","color":"blue"}," was disabled and you have been removed from it."]
execute unless data storage bingo:vars {teamBlue: "blue"} run playsound minecraft:block.note_block.bell master @a[team=blue]
execute unless data storage bingo:vars {teamBlue: "blue"} run team leave @a[team=blue]
