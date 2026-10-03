echo "Fix display brightness controls on the ASUS ROG Zephyrus G16 GU605MY"

rebuild_marker="${OMARCHY_GU605MY_REBUILD_MARKER:-/var/lib/omarchy/migrations/1790188786}"

# The marker, written only after the rebuild succeeds, retries an interrupted rebuild and stops another user's run repeating it.
if omarchy-hw-match "GU605MY" && omarchy-cmd-present limine-mkinitcpio && [[ ! -e $rebuild_marker ]]; then
  source "$OMARCHY_PATH/install/hardware/asus/fix-asus-gu605my-display-backlight.sh"
  sudo limine-mkinitcpio
  sudo install -Dm644 /dev/null "$rebuild_marker"
  omarchy-state set reboot-required
fi
