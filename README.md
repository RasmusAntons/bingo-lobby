# Bingo-Lobby

A mod for our Bingo server lobby world. The mod is enabled by setting the gamerule `bingoLoby` to `true`.

## Suggested service.properties
```
difficulty=peaceful
gamemode=adventure
level-type=minecraft\:normal
```

## Parkour

Beds can be placed as parkour checkpoints:

Set the custom_data component for the **foot end** of the bed: `/data modify block <x> <y> <z> components.minecraft:custom_data.parkour_checkpoint set value <checkpoint_number>`

A player can be teleported to their most recent parkour checkpoint with the `/resumeparkour <player>` command.

Players can return to the lobby with the `/quitparkpur` command.

The time it takes to teleport a player after entering a nether portal can be configured with `/gamerule playersNetherPortalDefaultDelay <ticks>`.

To reset a players progress, execute `/scoreboard players reset <username> parkour_checkpoint`.
