# dotfiles

Personal workstation configurations for **Hyprland** and **KDE Plasma 6** on Arch Linux (Wayland).

---

## Structure

* **`hyprland/`**: Compositor configs, lockscreen, and wallpaper setup (`hyprpaper`).
* **`kde/`**: KWin focus-follows-mouse settings, window rules, keyboard shortcuts, and `apply_settings.sh`.

---

## Features

* **KDE Plasma 6**:
  * Focus follows mouse (0ms delay, auto-raise).
  * Window opacity: 90% active, 80% inactive.
  * Moving windows with `Meta+Shift+[1-9]` tracks viewport to destination.
* **Hyprland**:
  * Keyboard-driven dynamic tiling workflow.
  * Screen lock via `hyprlock`.

---

## Apply KDE Settings

```bash
cd kde
chmod +x apply_settings.sh
./apply_settings.sh
