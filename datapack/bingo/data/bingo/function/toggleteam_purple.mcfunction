execute if block ~ ~2 ~ minecraft:purple_wool run data merge storage bingo:vars {teamPurple: ""}
execute unless block ~ ~2 ~ minecraft:purple_wool run data merge storage bingo:vars {teamPurple: "purple"}
execute if data storage bingo:vars {teamPurple: "purple"} run setblock ~ ~2 ~ minecraft:purple_wool
execute unless data storage bingo:vars {teamPurple: "purple"} run setblock ~ ~2 ~ minecraft:stripped_dark_oak_wood
execute unless data storage bingo:vars {teamPurple: "purple"} run tellraw @a[team=purple] ["Team ",{"text":"purple","color":"dark_purple"}," was disabled and you have been removed from it."]
execute unless data storage bingo:vars {teamPurple: "purple"} run playsound minecraft:block.note_block.bell master @a[team=purple]
execute unless data storage bingo:vars {teamPurple: "purple"} run team leave @a[team=purple]
