execute if block ~ ~2 ~ minecraft:yellow_wool run data merge storage bingo:vars {teamYellow: ""}
execute unless block ~ ~2 ~ minecraft:yellow_wool run data merge storage bingo:vars {teamYellow: "yellow"}
execute if data storage bingo:vars {teamYellow: "yellow"} run setblock ~ ~2 ~ minecraft:yellow_wool
execute unless data storage bingo:vars {teamYellow: "yellow"} run setblock ~ ~2 ~ minecraft:stripped_dark_oak_wood
execute unless data storage bingo:vars {teamYellow: "yellow"} run tellraw @a[team=yellow] ["Team ",{"text":"yellow","color":"yellow"}," was disabled and you have been removed from it."]
execute unless data storage bingo:vars {teamYellow: "yellow"} run playsound minecraft:block.note_block.bell master @a[team=yellow]
execute unless data storage bingo:vars {teamYellow: "yellow"} run team leave @a[team=yellow]
