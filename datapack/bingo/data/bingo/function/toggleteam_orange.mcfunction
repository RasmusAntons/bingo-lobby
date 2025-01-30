execute if block ~ ~2 ~ minecraft:orange_wool run data merge storage bingo:vars {teamOrange: ""}
execute unless block ~ ~2 ~ minecraft:orange_wool run data merge storage bingo:vars {teamOrange: "orange"}
execute if data storage bingo:vars {teamOrange: "orange"} run setblock ~ ~2 ~ minecraft:orange_wool
execute unless data storage bingo:vars {teamOrange: "orange"} run setblock ~ ~2 ~ minecraft:stripped_dark_oak_wood
execute unless data storage bingo:vars {teamOrange: "orange"} run tellraw @a[team=orange] ["Team ",{"text":"orange","color":"gold"}," was disabled and you have been removed from it."]
execute unless data storage bingo:vars {teamOrange: "orange"} run playsound minecraft:block.note_block.bell master @a[team=orange]
execute unless data storage bingo:vars {teamOrange: "orange"} run team leave @a[team=orange]
