package de.rasmusantons;

import com.mojang.serialization.Codec;
import it.unimi.dsi.fastutil.ints.Int2ObjectOpenHashMap;
import net.minecraft.core.BlockPos;
import net.minecraft.resources.Identifier;
import net.minecraft.server.level.ServerLevel;
import net.minecraft.world.level.saveddata.SavedData;
import net.minecraft.world.level.saveddata.SavedDataType;

import java.util.Map;

public class CheckpointPositionStorage extends SavedData {
    public static final Codec<CheckpointPositionStorage> CODEC  = Codec.unboundedMap(Codec.INT, BlockPos.CODEC)
            .fieldOf("checkpoint_positions")
            .codec()
            .xmap(CheckpointPositionStorage::new, CheckpointPositionStorage::getCheckpointPositions);

    public static final SavedDataType<CheckpointPositionStorage> TYPE = new SavedDataType<>(
            Identifier.fromNamespaceAndPath(BingoLobby.MOD_ID, "checkpoint_positions"),
            CheckpointPositionStorage::new,
            CODEC,
            null
    );

    private final Map<Integer, BlockPos> checkpointPositions = new Int2ObjectOpenHashMap<>();

    private CheckpointPositionStorage() {
    }

    private CheckpointPositionStorage(Map<Integer, BlockPos> checkpointPositions) {

    }

    private Map<Integer, BlockPos> getCheckpointPositions() {
        return checkpointPositions;
    }

    public void set(int checkpointNumber, BlockPos pos) {
        BlockPos oldValue = checkpointPositions.get(checkpointNumber);
        if (oldValue == null || !oldValue.equals(pos)) {
            checkpointPositions.put(checkpointNumber, pos);
            setDirty();
        }
    }

    public BlockPos get(int checkpointNumber) {
        return checkpointPositions.get(checkpointNumber);
    }

    public static CheckpointPositionStorage getStorage(ServerLevel level) {
        return level.getDataStorage().computeIfAbsent(TYPE);
    }
}
