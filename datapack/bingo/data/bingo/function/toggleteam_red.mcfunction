execute if block ~ ~2 ~ minecraft:red_wool run data merge storage bingo:vars {teamRed: ""}
execute unless block ~ ~2 ~ minecraft:red_wool run data merge storage bingo:vars {teamRed: "red"}
execute if data storage bingo:vars {teamRed: "red"} run setblock ~ ~2 ~ minecraft:red_wool
execute unless data storage bingo:vars {teamRed: "red"} run setblock ~ ~2 ~ minecraft:stripped_dark_oak_wood
execute unless data storage bingo:vars {teamRed: "red"} run tellraw @a[team=red] ["Team ",{"text":"red","color":"red"}," was disabled and you have been removed from it."]
execute unless data storage bingo:vars {teamRed: "red"} run playsound minecraft:block.note_block.bell master @a[team=red]
execute unless data storage bingo:vars {teamRed: "red"} run team leave @a[team=red]
