# chmod +x start_dockerfile.sh

docker run --name mindsdb_container -p 47334:47334 -p 47335:47335 mindsdb/mindsdb -d
