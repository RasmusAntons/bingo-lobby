package de.rasmusantons;

import de.rasmusantons.command.BingoLobbyCommands;
import net.fabricmc.api.ModInitializer;
import net.fabricmc.fabric.api.command.v2.CommandRegistrationCallback;
import net.fabricmc.fabric.api.gamerule.v1.GameRuleBuilder;
import net.fabricmc.fabric.api.networking.v1.ServerPlayConnectionEvents;
import net.minecraft.resources.Identifier;
import net.minecraft.world.level.gamerules.GameRule;
import net.minecraft.world.level.GameType;
import net.minecraft.world.level.gamerules.GameRuleCategory;

public class BingoLobby implements ModInitializer {
	public static final String MOD_ID = "bingo-lobby";
	public static final String PARKOUR_LEVEL_KEY = "parkour_checkpoint";

	public static final GameRule<Boolean> BINGO_LOBBY =
			GameRuleBuilder
					.forBoolean(false)
					.category(GameRuleCategory.MISC)
					.buildAndRegister(Identifier.fromNamespaceAndPath(MOD_ID, "is_bingo_lobby"));

	@Override
	public void onInitialize() {
		CommandRegistrationCallback.EVENT.register((dispatcher, context, environment) -> BingoLobbyCommands.register(dispatcher));
		ServerPlayConnectionEvents.JOIN.register((handler, sender, server) -> {
			if (handler.player.level().getGameRules().get(BINGO_LOBBY)) {
				handler.player.setGameMode(GameType.ADVENTURE);
			}
		});
	}
}
