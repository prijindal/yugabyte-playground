docker exec -it yb-multizone-ybmaster0-1 yb-admin -master_addresses ybmaster0:7100,ybmaster1:7100,ybmaster2:7100 get_universe_config

docker exec -it yb-multizone-ybmaster0-1 yb-admin -master_addresses ybmaster0:7100,ybmaster1:7100,ybmaster2:7100 modify_placement_info local.local.docker0,local.local.docker1,local.local.docker2 3

docker exec -it yb-multizone-ybmaster0-1 yb-admin -master_addresses ybmaster0:7100,ybmaster1:7100,ybmaster2:7100 set_preferred_zones local.local.docker0
