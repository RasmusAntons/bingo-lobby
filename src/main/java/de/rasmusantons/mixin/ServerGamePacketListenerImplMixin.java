package de.rasmusantons.mixin;

import de.rasmusantons.BingoLobby;
import de.rasmusantons.Utils;
import net.minecraft.network.protocol.game.ServerboundMovePlayerPacket;
import net.minecraft.server.level.ServerPlayer;
import net.minecraft.server.network.ServerGamePacketListenerImpl;
import org.spongepowered.asm.mixin.Mixin;
import org.spongepowered.asm.mixin.Shadow;
import org.spongepowered.asm.mixin.injection.At;
import org.spongepowered.asm.mixin.injection.Inject;
import org.spongepowered.asm.mixin.injection.callback.CallbackInfo;

import java.util.List;

@Mixin(ServerGamePacketListenerImpl.class)
public class ServerGamePacketListenerImplMixin {
    @Shadow public ServerPlayer player;

    @Inject(method = "handleMovePlayer", at = @At("TAIL"), cancellable = true)
    private void onMove(ServerboundMovePlayerPacket serverboundMovePlayerPacket, CallbackInfo ci) {
        if (this.player.fallDistance > 5 && this.player.serverLevel().getGameRules().getBoolean(BingoLobby.BINGO_LOBBY)) {
            if (this.player.getY() < -64) {
                Utils.resumeParkour(this.player.serverLevel(), List.of(this.player));
            }
        }
        ci.cancel();
    }
}
