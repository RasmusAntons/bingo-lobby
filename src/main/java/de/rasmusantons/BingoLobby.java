package de.rasmusantons;

import de.rasmusantons.command.BingoLobbyCommands;
import net.fabricmc.api.ModInitializer;
import net.fabricmc.fabric.api.command.v2.CommandRegistrationCallback;
import net.fabricmc.fabric.api.gamerule.v1.GameRuleFactory;
import net.fabricmc.fabric.api.gamerule.v1.GameRuleRegistry;
import net.fabricmc.fabric.api.networking.v1.ServerPlayConnectionEvents;
import net.minecraft.world.level.GameRules;
import net.minecraft.world.level.GameType;

public class BingoLobby implements ModInitializer {
	public static final String MOD_ID = "bingo-lobby";
	public static final String PARKOUR_LEVEL_KEY = "parkour_checkpoint";

	public static final GameRules.Key<GameRules.BooleanValue> BINGO_LOBBY =
			GameRuleRegistry.register(
					"bingoLobby",
					GameRules.Category.MISC,
					GameRuleFactory.createBooleanRule(false)
			);

	@Override
	public void onInitialize() {
		CommandRegistrationCallback.EVENT.register((dispatcher, context, environment) -> BingoLobbyCommands.register(dispatcher));
		ServerPlayConnectionEvents.JOIN.register((handler, sender, server) -> {
			if (handler.player.level().getGameRules().getRule(BINGO_LOBBY).get()) {
				handler.player.setGameMode(GameType.ADVENTURE);
			}
		});
	}
}
