docker compose run -v $(pwd)/:/tmp redis sh -c "redis-cli -h redis < /tmp/scripts/script.txt"
