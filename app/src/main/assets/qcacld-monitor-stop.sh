#!/system/bin/sh

# Restore normal wireless mode on NetHunter qcacld devices.

CON_MODE_PATH=""

for parameter in /sys/module/*/parameters/con_mode; do
    if [ -f "$parameter" ]; then
        CON_MODE_PATH="$parameter"
        break
    fi
done

if [ -z "$CON_MODE_PATH" ]; then
    echo "ERROR: con_mode parameter not found"
    exit 1
fi

CURRENT_MODE=$(cat "$CON_MODE_PATH") || exit 1

if [ "$CURRENT_MODE" = "0" ]; then
    echo "Normal wireless mode already active"
    exit 0
fi

svc wifi disable
ip link set wlan0 down || exit 1

if ! echo 0 > "$CON_MODE_PATH"; then
    echo "ERROR: Failed to restore normal mode"
    exit 1
fi

ip link set wlan0 up || exit 1

echo "Normal wireless mode restored"
