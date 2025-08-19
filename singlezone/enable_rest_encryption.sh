podman exec -it ybmaster0 openssl rand -out /tmp/universe_key 48 &&
podman exec -it ybmaster0 yb-admin --master_addresses ybmaster0,ybmaster1,ybmaster2 add_universe_key_to_all_masters master_key /tmp/universe_key &&
podman exec -it ybmaster0 yb-admin --master_addresses ybmaster0,ybmaster1,ybmaster2 all_masters_have_universe_key_in_memory master_key &&
podman exec -it ybmaster0 yb-admin --master_addresses ybmaster0,ybmaster1,ybmaster2 rotate_universe_key_in_memory master_key

