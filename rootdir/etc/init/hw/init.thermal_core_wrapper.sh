#!/vendor/bin/sh

TIMEOUT=30
ELAPSED=0

while [ $ELAPSED -lt $TIMEOUT ]; do
    for cd in /sys/class/thermal/cooling_device*; do
        [ -f "$cd/type" ] || continue
        if [ "$(cat "$cd/type" 2>/dev/null)" = "cpu_table_mapping" ]; then
            exec /vendor/bin/thermal_core
        fi
    done
    sleep 1
    ELAPSED=$((ELAPSED + 1))
done

exit 1
