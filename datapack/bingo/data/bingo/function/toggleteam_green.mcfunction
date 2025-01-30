execute if block ~ ~2 ~ minecraft:green_wool run data merge storage bingo:vars {teamGreen: ""}
execute unless block ~ ~2 ~ minecraft:green_wool run data merge storage bingo:vars {teamGreen: "green"}
execute if data storage bingo:vars {teamGreen: "green"} run setblock ~ ~2 ~ minecraft:green_wool
execute unless data storage bingo:vars {teamGreen: "green"} run setblock ~ ~2 ~ minecraft:stripped_dark_oak_wood
execute unless data storage bingo:vars {teamGreen: "green"} run tellraw @a[team=green] ["Team ",{"text":"green","color":"green"}," was disabled and you have been removed from it."]
execute unless data storage bingo:vars {teamGreen: "green"} run playsound minecraft:block.note_block.bell master @a[team=green]
execute unless data storage bingo:vars {teamGreen: "green"} run team leave @a[team=green]
