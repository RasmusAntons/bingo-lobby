package de.rasmusantons.mixin;

import de.rasmusantons.BingoLobby;
import net.minecraft.core.NonNullList;
import net.minecraft.core.component.DataComponents;
import net.minecraft.resources.Identifier;
import net.minecraft.server.level.ServerPlayer;
import net.minecraft.sounds.SoundEvents;
import net.minecraft.sounds.SoundSource;
import net.minecraft.world.entity.player.Player;
import net.minecraft.world.inventory.AbstractContainerMenu;
import net.minecraft.world.inventory.ContainerInput;
import net.minecraft.world.inventory.Slot;
import net.minecraft.world.item.ItemStack;
import net.minecraft.world.item.Items;
import net.minecraft.world.item.component.CustomData;
import net.minecraft.world.level.GameType;
import org.spongepowered.asm.mixin.Final;
import org.spongepowered.asm.mixin.Mixin;
import org.spongepowered.asm.mixin.Shadow;
import org.spongepowered.asm.mixin.injection.At;
import org.spongepowered.asm.mixin.injection.Inject;
import org.spongepowered.asm.mixin.injection.callback.CallbackInfo;

import java.util.Objects;
import java.util.Optional;

@Mixin(AbstractContainerMenu.class)
public class AbstractContainerMenuMixin {
    private static final String DISABLED_TAG = "bingo:finish";

    @Shadow
    @Final
    public NonNullList<Slot> slots;

    @Inject(method = "doClick", at = @At(value = "HEAD"), cancellable = true)
    protected void createMenu(int slotIndex, int buttonNum, ContainerInput containerInput, Player player, CallbackInfo ci) {
        if (player instanceof ServerPlayer serverPlayer && serverPlayer.level().getGameRules().get(BingoLobby.BINGO_LOBBY)) {
            try {
                if (player.gameMode() == GameType.CREATIVE) {
                    return;
                }
                Slot slot = slots.get(slotIndex);
                CustomData customData = slot.getItem().getComponents().get(DataComponents.CUSTOM_DATA);
                if (customData == null) {
                    return;
                }
                Optional<String> optionalBingoTag = customData.copyTag().getString("bingo_tag_selection");
                if (optionalBingoTag.isEmpty()) {
                    return;
                }
                String bingoTag = optionalBingoTag.get();
                ItemStack newItem;
                var storage = Objects.requireNonNull(player.level().getServer()).getCommandStorage().get(Identifier.fromNamespaceAndPath("bingo", "vars"));
                if (storage.getString("tag_" + bingoTag).orElse(DISABLED_TAG).equals(DISABLED_TAG)) {
                    storage.putString("tag_" + bingoTag, "enigmaticsbingogoals:" + bingoTag);
                    newItem = new ItemStack(Items.CARVED_PUMPKIN);

                } else {
                    storage.putString("tag_" + bingoTag, DISABLED_TAG);
                    newItem = new ItemStack(Items.JACK_O_LANTERN);
                }
                newItem.copyFrom(DataComponents.CUSTOM_DATA, slot.getItem());
                newItem.copyFrom(DataComponents.ITEM_NAME, slot.getItem());
                slot.set(newItem);
                player.level().playSound(null, player, SoundEvents.LEVER_CLICK, SoundSource.BLOCKS, 1f, 1f);
                ci.cancel();
            } catch (Exception _) {
            }
        }
    }
}
