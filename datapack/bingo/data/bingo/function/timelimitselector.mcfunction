execute if data entity @e[type=minecraft:item_frame,x=-347,y=26,z=314,dx=1,dy=1,dz=1,limit=1] {ItemRotation: 0b} run data merge storage bingo:vars {"timelimit": 1800}
execute if data entity @e[type=minecraft:item_frame,x=-347,y=26,z=314,dx=1,dy=1,dz=1,limit=1] {ItemRotation: 1b} run data merge storage bingo:vars {"timelimit": 3600}
execute if data entity @e[type=minecraft:item_frame,x=-347,y=26,z=314,dx=1,dy=1,dz=1,limit=1] {ItemRotation: 2b} run data merge storage bingo:vars {"timelimit": 5400}
execute if data entity @e[type=minecraft:item_frame,x=-347,y=26,z=314,dx=1,dy=1,dz=1,limit=1] {ItemRotation: 3b} run data merge storage bingo:vars {"timelimit": 7200}
execute if data entity @e[type=minecraft:item_frame,x=-347,y=26,z=314,dx=1,dy=1,dz=1,limit=1] {ItemRotation: 4b} run data merge storage bingo:vars {"timelimit": 10800}
execute if data entity @e[type=minecraft:item_frame,x=-347,y=26,z=314,dx=1,dy=1,dz=1,limit=1] {ItemRotation: 5b} run data merge storage bingo:vars {"timelimit": 14400}
execute if data entity @e[type=minecraft:item_frame,x=-347,y=26,z=314,dx=1,dy=1,dz=1,limit=1] {ItemRotation: 6b} run data merge storage bingo:vars {"timelimit": 18000}
execute if data entity @e[type=minecraft:item_frame,x=-347,y=26,z=314,dx=1,dy=1,dz=1,limit=1] {ItemRotation: 7b} run data merge storage bingo:vars {"timelimit": 0}
execute at @e[type=minecraft:item_frame,x=-347,y=26,z=314,dx=1,dy=1,dz=1,limit=1] run data merge block ~ ~1 ~1 {"front_text": {"has_glowing_text": 0b}}
execute at @e[type=minecraft:item_frame,x=-347,y=26,z=314,dx=1,dy=1,dz=1,limit=1] run data merge block ~ ~1 ~ {"front_text": {"has_glowing_text": 0b}}
execute at @e[type=minecraft:item_frame,x=-347,y=26,z=314,dx=1,dy=1,dz=1,limit=1] run data merge block ~ ~1 ~-1 {"front_text": {"has_glowing_text": 0b}}
execute at @e[type=minecraft:item_frame,x=-347,y=26,z=314,dx=1,dy=1,dz=1,limit=1] run data merge block ~ ~ ~-1 {"front_text": {"has_glowing_text": 0b}}
execute at @e[type=minecraft:item_frame,x=-347,y=26,z=314,dx=1,dy=1,dz=1,limit=1] run data merge block ~ ~-1 ~1 {"front_text": {"has_glowing_text": 0b}}
execute at @e[type=minecraft:item_frame,x=-347,y=26,z=314,dx=1,dy=1,dz=1,limit=1] run data merge block ~ ~-1 ~ {"front_text": {"has_glowing_text": 0b}}
execute at @e[type=minecraft:item_frame,x=-347,y=26,z=314,dx=1,dy=1,dz=1,limit=1] run data merge block ~ ~ ~1 {"front_text": {"has_glowing_text": 0b}}
execute at @e[type=minecraft:item_frame,x=-347,y=26,z=314,dx=1,dy=1,dz=1,limit=1] run data merge block ~ ~-1 ~-1 {"front_text": {"has_glowing_text": 0b}}
execute if data storage bingo:vars {timelimit: 1800} at @e[type=minecraft:item_frame,x=-347,y=26,z=314,dx=1,dy=1,dz=1,limit=1] run data merge block ~ ~1 ~-1 {"front_text": {"has_glowing_text": 1b}}
execute if data storage bingo:vars {timelimit: 3600} at @e[type=minecraft:item_frame,x=-347,y=26,z=314,dx=1,dy=1,dz=1,limit=1] run data merge block ~ ~ ~-1 {"front_text": {"has_glowing_text": 1b}}
execute if data storage bingo:vars {timelimit: 5400} at @e[type=minecraft:item_frame,x=-347,y=26,z=314,dx=1,dy=1,dz=1,limit=1] run data merge block ~ ~-1 ~-1 {"front_text": {"has_glowing_text": 1b}}
execute if data storage bingo:vars {timelimit: 7200} at @e[type=minecraft:item_frame,x=-347,y=26,z=314,dx=1,dy=1,dz=1,limit=1] run data merge block ~ ~-1 ~ {"front_text": {"has_glowing_text": 1b}}
execute if data storage bingo:vars {timelimit: 10800} at @e[type=minecraft:item_frame,x=-347,y=26,z=314,dx=1,dy=1,dz=1,limit=1] run data merge block ~ ~-1 ~1 {"front_text": {"has_glowing_text": 1b}}
execute if data storage bingo:vars {timelimit: 14400} at @e[type=minecraft:item_frame,x=-347,y=26,z=314,dx=1,dy=1,dz=1,limit=1] run data merge block ~ ~ ~1 {"front_text": {"has_glowing_text": 1b}}
execute if data storage bingo:vars {timelimit: 18000} at @e[type=minecraft:item_frame,x=-347,y=26,z=314,dx=1,dy=1,dz=1,limit=1] run data merge block ~ ~1 ~1 {"front_text": {"has_glowing_text": 1b}}
execute if data storage bingo:vars {timelimit: 0} at @e[type=minecraft:item_frame,x=-347,y=26,z=314,dx=1,dy=1,dz=1,limit=1] run data merge block ~ ~1 ~ {"front_text": {"has_glowing_text": 1b}}

