#!/usr/bin/env bash
set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
echo "Restoring KDE Plasma settings from $DIR..."

# Copy config files back into ~/.config
cp "$DIR/kwinrc" ~/.config/
cp "$DIR/kwinrulesrc" ~/.config/
cp "$DIR/kglobalshortcutsrc" ~/.config/
cp "$DIR/plasma-org.kde.plasma.desktop-appletsrc" ~/.config/

# Apply wallpaper via D-Bus
if [ -f "/usr/share/hypr/wall2.png" ]; then
  qdbus6 org.kde.plasmashell /PlasmaShell org.kde.PlasmaShell.evaluateScript '
  var allDesktops = desktops();
  for (var i = 0; i < allDesktops.length; i++) {
      var d = allDesktops[i];
      d.wallpaperPlugin = "org.kde.image";
      d.currentConfigGroup = ["Wallpaper", "org.kde.image", "General"];
      d.writeConfig("Image", "file:///usr/share/hypr/wall2.png");
  }
  '
fi

# Reload shortcuts, compositor, and window manager
systemctl --user restart plasma-kglobalaccel.service
qdbus6 org.kde.KWin /KWin reconfigure
qdbus6 org.kde.KWin /Effects org.kde.kwin.Effects.loadEffect translucency 2>/dev/null || true
qdbus6 org.kde.KWin /Effects org.kde.kwin.Effects.reconfigureEffect translucency 2>/dev/null || true

echo "Settings successfully applied!"
