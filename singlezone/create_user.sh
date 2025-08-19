podman exec -it ybtserver0 ysqlsh "postgres://yugabyte:yugabyte@ybtserver0,ybtserver1,ybtserver2:5433/yugabyte" -c "CREATE USER workload WITH PASSWORD 'workload';" &&
podman exec -it ybtserver0 ysqlsh "postgres://yugabyte:yugabyte@ybtserver0,ybtserver1,ybtserver2:5433/yugabyte" -c "CREATE DATABASE workload OWNER workload;"
