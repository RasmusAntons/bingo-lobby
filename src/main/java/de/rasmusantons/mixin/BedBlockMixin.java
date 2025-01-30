package de.rasmusantons.mixin;

import de.rasmusantons.CheckpointPositionStorage;
import de.rasmusantons.Utils;
import net.minecraft.core.BlockPos;
import net.minecraft.core.component.DataComponents;
import net.minecraft.network.chat.Component;
import net.minecraft.server.ServerScoreboard;
import net.minecraft.server.level.ServerLevel;
import net.minecraft.server.level.ServerPlayer;
import net.minecraft.world.InteractionResult;
import net.minecraft.world.entity.player.Player;
import net.minecraft.world.item.component.CustomData;
import net.minecraft.world.level.GameType;
import net.minecraft.world.level.Level;
import net.minecraft.world.level.block.BedBlock;
import net.minecraft.world.level.block.state.BlockState;
import net.minecraft.world.level.block.state.properties.BedPart;
import net.minecraft.world.phys.BlockHitResult;
import net.minecraft.world.scores.Objective;
import net.minecraft.world.scores.ScoreAccess;
import net.minecraft.world.scores.criteria.ObjectiveCriteria;
import org.spongepowered.asm.mixin.Mixin;
import org.spongepowered.asm.mixin.injection.At;
import org.spongepowered.asm.mixin.injection.Inject;
import org.spongepowered.asm.mixin.injection.callback.CallbackInfoReturnable;

import java.util.Objects;

import static de.rasmusantons.BingoLobby.BINGO_LOBBY;
import static de.rasmusantons.BingoLobby.PARKOUR_LEVEL_KEY;

@Mixin(BedBlock.class)
public class BedBlockMixin {
	@Inject(at = @At("HEAD"), method = "useWithoutItem", cancellable = true)
	private void onUseWithoutItem(BlockState blockState, Level level, BlockPos blockPos, Player player, BlockHitResult blockHitResult, CallbackInfoReturnable<InteractionResult> cir) {
		if (!(player instanceof ServerPlayer serverPlayer) || serverPlayer.gameMode.getGameModeForPlayer() != GameType.ADVENTURE || !serverPlayer.serverLevel().getGameRules().getRule(BINGO_LOBBY).get()) {
			return;
		}
		if (blockState.getValue(BedBlock.PART) == BedPart.HEAD) {
			blockPos = blockPos.relative(blockState.getValue(BedBlock.FACING).getOpposite());
		}
        CustomData customData = Objects.requireNonNull(level.getBlockEntity(blockPos)).components().get(DataComponents.CUSTOM_DATA);
		if (customData == null) {
			return;
		}
		int checkpointNumber = customData.copyTag().getInt(PARKOUR_LEVEL_KEY);
		serverPlayer.sendSystemMessage(Utils.addFallback(Component.translatable("bingo_lobby.action.reachCheckpoint", checkpointNumber)));
		CheckpointPositionStorage checkpointPositions = CheckpointPositionStorage.getStorage((ServerLevel) level);
		checkpointPositions.set(checkpointNumber, blockPos);
        Objective objective = level.getScoreboard().getObjective(PARKOUR_LEVEL_KEY);
		if (objective == null) {
			objective = level.getScoreboard().addObjective(PARKOUR_LEVEL_KEY, ObjectiveCriteria.DUMMY, Utils.addFallback(Component.translatable("bingo_lobby.scoreboard.parkourCheckpoint")), ObjectiveCriteria.RenderType.INTEGER, false, null);
		}
        ScoreAccess score = level.getScoreboard().getOrCreatePlayerScore(player, objective, true);
		score.set(checkpointNumber);
		cir.setReturnValue(InteractionResult.SUCCESS);
	}
}
