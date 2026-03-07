#!/vendor/bin/sh

TIMEOUT=10
ELAPSED=0

while [ "$ELAPSED" -lt "$TIMEOUT" ]; do
    grep -rqs 'cpu_table_mapping' /sys/class/thermal/cooling_device*/type && break
    sleep 1
    ELAPSED=$((ELAPSED + 1))
done

exec /vendor/bin/thermal_core
