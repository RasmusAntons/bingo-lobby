package de.rasmusantons.command;

import com.mojang.brigadier.Command;
import com.mojang.brigadier.CommandDispatcher;
import com.mojang.brigadier.exceptions.CommandSyntaxException;
import de.rasmusantons.Utils;
import net.minecraft.commands.CommandSourceStack;
import net.minecraft.server.level.ServerPlayer;

import java.util.Collection;
import java.util.List;
import java.util.Objects;

import static net.minecraft.commands.Commands.argument;
import static net.minecraft.commands.Commands.literal;
import static net.minecraft.commands.arguments.EntityArgument.getPlayers;
import static net.minecraft.commands.arguments.EntityArgument.players;

public class ResumeParkourCommand {
    public static void register(CommandDispatcher<CommandSourceStack> dispatcher) {
        dispatcher.register(
                literal("resumeparkour")
                        .requires(source -> source.hasPermission(2))
                        .executes(ctx -> resumeParkour(ctx.getSource()))
                        .then(argument("players", players())
                                .executes(ctx -> resumeParkour(ctx.getSource(), getPlayers(ctx, "players")))
                        )
        );
    }

    private static int resumeParkour(CommandSourceStack source) {
        return resumeParkour(source, List.of(Objects.requireNonNull(source.getPlayer())));
    }

    private static int resumeParkour(CommandSourceStack source, Collection<ServerPlayer> players) {
        Utils.resumeParkour(source.getLevel(), players);
        return Command.SINGLE_SUCCESS;
    }
}
