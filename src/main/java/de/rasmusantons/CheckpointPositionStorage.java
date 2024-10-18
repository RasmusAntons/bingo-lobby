package de.rasmusantons;

import net.minecraft.core.BlockPos;
import net.minecraft.core.HolderLookup;
import net.minecraft.nbt.CompoundTag;
import net.minecraft.server.level.ServerLevel;
import net.minecraft.world.level.saveddata.SavedData;
import org.jetbrains.annotations.NotNull;

import java.util.HashMap;
import java.util.Map;

public class CheckpointPositionStorage extends SavedData {
    private final Map<Integer, BlockPos> checkpointPositions = new HashMap<>();

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

    @Override
    public @NotNull CompoundTag save(CompoundTag tag, HolderLookup.Provider registryLookup) {
        for (Map.Entry<Integer, BlockPos> entry : checkpointPositions.entrySet()) {
            BlockPos pos = entry.getValue();
            tag.putIntArray(entry.getKey().toString(), new int[]{pos.getX(), pos.getY(), pos.getZ()});
        }
        return tag;
    }

    public static CheckpointPositionStorage createFromTag(CompoundTag tag, HolderLookup.Provider registryLookup) {
        CheckpointPositionStorage store = new CheckpointPositionStorage();
        for (String key : tag.getAllKeys()) {
            int checkpointNumber = Integer.parseInt(key);
            int[] pos = tag.getIntArray(key);
            store.checkpointPositions.put(checkpointNumber, new BlockPos(pos[0], pos[1], pos[2]));
        }
        return store;
    }

    private static final Factory<CheckpointPositionStorage> factory = new Factory<>(CheckpointPositionStorage::new, CheckpointPositionStorage::createFromTag, null);

    public static CheckpointPositionStorage getStorage(ServerLevel level) {
        return level.getDataStorage().computeIfAbsent(factory, BingoLobby.MOD_ID);
    }
}
