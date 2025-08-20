YB_TSERVERS="10.42.1.200,10.42.1.201,10.42.1.202"

podman exec -it ybtserver0 ysqlsh "postgres://yugabyte:yugabyte@$YB_TSERVERS:5433/yugabyte" -c "ALTER ROLE yugabyte WITH PASSWORD 'yugabyte';" &&
podman exec -it ybtserver0 ysqlsh "postgres://yugabyte:yugabyte@$YB_TSERVERS:5433/yugabyte" -c "CREATE USER workload WITH PASSWORD 'workload';" &&
podman exec -it ybtserver0 ysqlsh "postgres://yugabyte:yugabyte@$YB_TSERVERS:5433/yugabyte" -c "CREATE DATABASE workload OWNER workload;"
