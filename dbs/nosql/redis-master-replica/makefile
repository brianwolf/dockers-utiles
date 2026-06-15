# ------------------------------------
# docker
# ------------------------------------
up:
	cd redis && docker compose up -d
	

down: 
	cd redis && docker compose down --remove-orphans -t 0


# ------------------------------------
# pruebas
# ------------------------------------
booom-01:
	docker stop m1 s1 

restore-01:
	docker start m1 s1

booom-02:
	docker stop b1 s2 

restore-02:
	docker start b1 s2

rollback:
	redis-cli -p 5001 -a redis SENTINEL RESET server1

