YB_MASTERS="10.42.1.100,10.42.1.101,10.42.1.102"

IS_ENABLED=$(podman exec -it ybmaster0 yb-admin --master_addresses $YB_MASTERS is_encryption_enabled | grep ENABLED)

if [ -z "$IS_ENABLED" ]; then
    podman exec -it ybmaster0 openssl rand -out /tmp/universe_key 48 &&
    podman exec -it ybmaster0 yb-admin --master_addresses $YB_MASTERS add_universe_key_to_all_masters master_key /tmp/universe_key &&
    podman exec -it ybmaster0 yb-admin --master_addresses $YB_MASTERS all_masters_have_universe_key_in_memory master_key &&
    podman exec -it ybmaster0 yb-admin --master_addresses $YB_MASTERS rotate_universe_key_in_memory master_key
else
    echo "Encryption is already enabled"
fi
