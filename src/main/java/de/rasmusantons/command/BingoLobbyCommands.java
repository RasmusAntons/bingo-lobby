package de.rasmusantons.command;

import com.mojang.brigadier.CommandDispatcher;
import net.minecraft.commands.CommandSourceStack;

public class BingoLobbyCommands {
    public static void register(CommandDispatcher<CommandSourceStack> dispatcher) {
        ResumeParkourCommand.register(dispatcher);
        QuitParkourCommand.register(dispatcher);
    }
}
