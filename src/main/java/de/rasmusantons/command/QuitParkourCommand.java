package de.rasmusantons.command;

import com.mojang.brigadier.Command;
import com.mojang.brigadier.CommandDispatcher;
import de.rasmusantons.BingoLobby;
import net.minecraft.commands.CommandSourceStack;
import net.minecraft.server.level.ServerPlayer;
import net.minecraft.sounds.SoundEvents;

import java.util.Objects;

import static net.minecraft.commands.Commands.literal;

public class QuitParkourCommand {
    public static void register(CommandDispatcher<CommandSourceStack> dispatcher) {
        dispatcher.register(
                literal("quitparkour")
                        .executes(ctx -> quitParkour(ctx.getSource()))
        );
    }

    private static int quitParkour(CommandSourceStack source) {
        if (source.getLevel().getGameRules().getBoolean(BingoLobby.BINGO_LOBBY)) {
            ServerPlayer player = Objects.requireNonNull(source.getPlayer());
            var pos = player.serverLevel().getSharedSpawnPos();
            player.teleportTo(pos.getX(), pos.getY(), pos.getZ());
            player.setRemainingFireTicks(0);
            player.resetFallDistance();
            player.setOnGround(true);
            player.setHealth(player.getMaxHealth());
            player.playNotifySound(SoundEvents.PLAYER_TELEPORT, player.getSoundSource(), 1.0F, 1.0F);
        }
        return Command.SINGLE_SUCCESS;
    }
}
