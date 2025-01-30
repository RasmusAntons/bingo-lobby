package de.rasmusantons;

import net.minecraft.ChatFormatting;
import net.minecraft.core.BlockPos;
import net.minecraft.locale.Language;
import net.minecraft.network.chat.*;
import net.minecraft.network.chat.contents.TranslatableContents;
import net.minecraft.network.protocol.game.ClientboundHurtAnimationPacket;
import net.minecraft.server.level.ServerLevel;
import net.minecraft.server.level.ServerPlayer;
import net.minecraft.sounds.SoundEvents;
import net.minecraft.world.scores.Objective;
import net.minecraft.world.scores.ReadOnlyScoreInfo;

import java.util.Collection;

import static de.rasmusantons.BingoLobby.PARKOUR_LEVEL_KEY;

public class Utils {
    public static MutableComponent addFallback(MutableComponent component) {
        if (component.getContents() instanceof TranslatableContents translatable) {
            Object[] args = translatable.getArgs();
            if (args.length > 0) {
                for (int i = 0; i < args.length; i++) {
                    if (args[i] instanceof MutableComponent subComponent) {
                        args[i] = addFallback(subComponent);
                    }
                }
            }
            final String fallbackText = Language.getInstance().getOrDefault(translatable.getKey(), null);
            return Component.translatableWithFallback(translatable.getKey(), fallbackText, args)
                    .withStyle(component.getStyle());
        }
        return component;
    }

    public static void resumeParkour(ServerLevel level, Collection<ServerPlayer> players) {
        Objective objective = level.getScoreboard().getObjective(PARKOUR_LEVEL_KEY);
        if (objective == null) {
            return;
        }
        CheckpointPositionStorage checkpointPositions = CheckpointPositionStorage.getStorage(level);
        for (ServerPlayer player : players) {
            int checkpointNumber = 0;
            ReadOnlyScoreInfo score = level.getScoreboard().getPlayerScoreInfo(player, objective);
            if (score != null) {
                checkpointNumber = score.value();
            }
            BlockPos checkpointPosition = checkpointPositions.get(checkpointNumber);
            if (checkpointPosition == null) {
                player.sendSystemMessage(Utils.addFallback(Component.translatable("bingo_lobby.resumeparkour.missingCheckpointLocation", checkpointNumber)));
                continue;
            }
            player.teleportTo(checkpointPosition.getX() + 0.5, checkpointPosition.getY() + 0.8, checkpointPosition.getZ() + 0.5);
            player.setCamera(player);
            player.connection.send(new ClientboundHurtAnimationPacket(player));
            player.setRemainingFireTicks(0);
            player.resetFallDistance();
            player.setOnGround(true);
            player.setHealth(player.getMaxHealth());
            player.playNotifySound(SoundEvents.PLAYER_TELEPORT, player.getSoundSource(), 1.0F, 1.0F);
            var commandComponent = Component.literal("/quitparkour").withStyle(Style.EMPTY
                    .withBold(true)
                    .withColor(ChatFormatting.LIGHT_PURPLE)
                    .withClickEvent(new ClickEvent(ClickEvent.Action.RUN_COMMAND, "/quitparkour"))
            );
            player.sendSystemMessage(Utils.addFallback(Component.translatable("bingo_lobby.resumeparkour.info", commandComponent)));
        }
    }
}
