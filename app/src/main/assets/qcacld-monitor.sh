#!/system/bin/sh

# Hijacker NetHunter qcacld 3.0 monitor-mode support.
# Requires Magisk root and a compatible patched kernel.

CON_MODE_PATH=""

for parameter in /sys/module/*/parameters/con_mode; do
    if [ -f "$parameter" ]; then
        CON_MODE_PATH="$parameter"
        break
    fi
done

if [ -z "$CON_MODE_PATH" ]; then
    echo "ERROR: qcacld con_mode parameter not found"
    exit 1
fi

CURRENT_MODE=$(cat "$CON_MODE_PATH") || exit 1

if [ "$CURRENT_MODE" = "4" ]; then
    echo "Monitor mode already enabled"
    exit 0
fi

echo "Enabling qcacld monitor mode"

svc wifi disable
ip link set wlan0 down || exit 1

if ! echo 4 > "$CON_MODE_PATH"; then
    echo "ERROR: Unable to enable monitor mode"
    ip link set wlan0 up
    exit 1
fi

ip link set wlan0 up || exit 1

echo "Monitor mode enabled on wlan0"
