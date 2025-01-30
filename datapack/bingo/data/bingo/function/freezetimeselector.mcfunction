execute if data entity @e[type=minecraft:item_frame,x=-342,y=25,z=313,dx=1,dy=1,dz=1,limit=1] {ItemRotation: 0b} run data merge storage bingo:vars {"freezetime": 10}
execute if data entity @e[type=minecraft:item_frame,x=-342,y=25,z=313,dx=1,dy=1,dz=1,limit=1] {ItemRotation: 1b} run data merge storage bingo:vars {"freezetime": 20}
execute if data entity @e[type=minecraft:item_frame,x=-342,y=25,z=313,dx=1,dy=1,dz=1,limit=1] {ItemRotation: 2b} run data merge storage bingo:vars {"freezetime": 30}
execute if data entity @e[type=minecraft:item_frame,x=-342,y=25,z=313,dx=1,dy=1,dz=1,limit=1] {ItemRotation: 3b} run data merge storage bingo:vars {"freezetime": 45}
execute if data entity @e[type=minecraft:item_frame,x=-342,y=25,z=313,dx=1,dy=1,dz=1,limit=1] {ItemRotation: 4b} run data merge storage bingo:vars {"freezetime": 60}
execute if data entity @e[type=minecraft:item_frame,x=-342,y=25,z=313,dx=1,dy=1,dz=1,limit=1] {ItemRotation: 5b} run data merge storage bingo:vars {"freezetime": 90}
execute if data entity @e[type=minecraft:item_frame,x=-342,y=25,z=313,dx=1,dy=1,dz=1,limit=1] {ItemRotation: 6b} run data merge storage bingo:vars {"freezetime": 120}
execute if data entity @e[type=minecraft:item_frame,x=-342,y=25,z=313,dx=1,dy=1,dz=1,limit=1] {ItemRotation: 7b} run data merge storage bingo:vars {"freezetime": 0}
execute at @e[type=minecraft:item_frame,x=-342,y=25,z=313,dx=1,dy=1,dz=1,limit=1] run data merge block ~ ~1 ~1 {"front_text": {"has_glowing_text": 0b}}
execute at @e[type=minecraft:item_frame,x=-342,y=25,z=313,dx=1,dy=1,dz=1,limit=1] run data merge block ~ ~1 ~ {"front_text": {"has_glowing_text": 0b}}
execute at @e[type=minecraft:item_frame,x=-342,y=25,z=313,dx=1,dy=1,dz=1,limit=1] run data merge block ~ ~1 ~-1 {"front_text": {"has_glowing_text": 0b}}
execute at @e[type=minecraft:item_frame,x=-342,y=25,z=313,dx=1,dy=1,dz=1,limit=1] run data merge block ~ ~ ~-1 {"front_text": {"has_glowing_text": 0b}}
execute at @e[type=minecraft:item_frame,x=-342,y=25,z=313,dx=1,dy=1,dz=1,limit=1] run data merge block ~ ~-1 ~1 {"front_text": {"has_glowing_text": 0b}}
execute at @e[type=minecraft:item_frame,x=-342,y=25,z=313,dx=1,dy=1,dz=1,limit=1] run data merge block ~ ~-1 ~ {"front_text": {"has_glowing_text": 0b}}
execute at @e[type=minecraft:item_frame,x=-342,y=25,z=313,dx=1,dy=1,dz=1,limit=1] run data merge block ~ ~ ~1 {"front_text": {"has_glowing_text": 0b}}
execute at @e[type=minecraft:item_frame,x=-342,y=25,z=313,dx=1,dy=1,dz=1,limit=1] run data merge block ~ ~-1 ~-1 {"front_text": {"has_glowing_text": 0b}}
execute if data storage bingo:vars {freezetime: 10} run data merge block -341 26 312 {"front_text": {"has_glowing_text": 1b}}
execute if data storage bingo:vars {freezetime: 20} run data merge block -341 25 312 {"front_text": {"has_glowing_text": 1b}}
execute if data storage bingo:vars {freezetime: 30} run data merge block -341 24 312 {"front_text": {"has_glowing_text": 1b}}
execute if data storage bingo:vars {freezetime: 45} run data merge block -341 24 313 {"front_text": {"has_glowing_text": 1b}}
execute if data storage bingo:vars {freezetime: 60} run data merge block -341 24 314 {"front_text": {"has_glowing_text": 1b}}
execute if data storage bingo:vars {freezetime: 90} run data merge block -341 25 314 {"front_text": {"has_glowing_text": 1b}}
execute if data storage bingo:vars {freezetime: 120} run data merge block -341 26 314 {"front_text": {"has_glowing_text": 1b}}
execute if data storage bingo:vars {freezetime: 0} run data merge block -341 26 313 {"front_text": {"has_glowing_text": 1b}}
