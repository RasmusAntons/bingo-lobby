package de.rasmusantons.command;

import com.mojang.brigadier.Command;
import com.mojang.brigadier.CommandDispatcher;
import de.rasmusantons.BingoLobby;
import net.minecraft.commands.CommandSourceStack;
import net.minecraft.core.Holder;
import net.minecraft.network.protocol.game.ClientboundSoundEntityPacket;
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
        if (source.getLevel().getGameRules().get(BingoLobby.BINGO_LOBBY)) {
            ServerPlayer player = Objects.requireNonNull(source.getPlayer());
            var pos = player.level().getRespawnData().pos();
            player.teleportTo(pos.getX(), pos.getY(), pos.getZ());
            player.setRemainingFireTicks(0);
            player.resetFallDistance();
            player.setOnGround(true);
            player.setHealth(player.getMaxHealth());
            player.connection.send(new ClientboundSoundEntityPacket(
                    Holder.direct(SoundEvents.PLAYER_TELEPORT), player.getSoundSource(),
                    player, 1f, 1f, player.getRandom().nextLong()
            ));
        }
        return Command.SINGLE_SUCCESS;
    }
}
