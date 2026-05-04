package de.rasmusantons.mixin;

import de.rasmusantons.BingoLobby;
import de.rasmusantons.Utils;
import net.minecraft.core.BlockPos;
import net.minecraft.server.level.ServerLevel;
import net.minecraft.server.level.ServerPlayer;
import net.minecraft.world.entity.Entity;
import net.minecraft.world.level.block.NetherPortalBlock;
import net.minecraft.world.level.portal.TeleportTransition;
import org.spongepowered.asm.mixin.Mixin;
import org.spongepowered.asm.mixin.injection.At;
import org.spongepowered.asm.mixin.injection.Inject;
import org.spongepowered.asm.mixin.injection.callback.CallbackInfoReturnable;

import java.util.List;

@Mixin(NetherPortalBlock.class)
public class NetherPortalBlockMixin {
    @Inject(method = "getPortalDestination", at = @At("HEAD"), cancellable = true)
    private void onUse(ServerLevel currentLevel, Entity entity, BlockPos portalEntryPos, CallbackInfoReturnable<TeleportTransition> cir) {
        if (entity instanceof ServerPlayer serverPlayer && serverPlayer.level().getGameRules().get(BingoLobby.BINGO_LOBBY)) {
            Utils.resumeParkour(serverPlayer.level(), List.of(serverPlayer));
            cir.setReturnValue(null);
        }
    }
}
