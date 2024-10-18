package de.rasmusantons.mixin;

import de.rasmusantons.BingoLobby;
import de.rasmusantons.Utils;
import net.minecraft.server.level.ServerLevel;
import net.minecraft.server.level.ServerPlayer;
import org.spongepowered.asm.mixin.Mixin;
import org.spongepowered.asm.mixin.Shadow;
import org.spongepowered.asm.mixin.injection.At;
import org.spongepowered.asm.mixin.injection.Inject;
import org.spongepowered.asm.mixin.injection.callback.CallbackInfo;

import java.util.List;

@Mixin(ServerPlayer.class)
public abstract class ServerPlayerMixin {
    @Shadow public abstract ServerLevel serverLevel();

    @Inject(method = "die", at = @At("HEAD"), cancellable = true)
    private void onDeath(CallbackInfo ci) {
        if (this.serverLevel().getGameRules().getBoolean(BingoLobby.BINGO_LOBBY)) {
            Utils.resumeParkour(serverLevel(), List.of((ServerPlayer) (Object) this));
            ci.cancel();
        }
    }
}
