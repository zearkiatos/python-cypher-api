activate:
	source run.sh; activate

install:
	source run.sh; install

run:
	source run.sh; run $(port)

run-docker:
ifeq ($(strip $(port)),)
	flask run -h 0.0.0.0
else
	flask run -p $(port) -h 0.0.0.0
endif

docker-dev-up:
	docker compose -f docker-compose.dev.yml up --build -d

docker-dev-down:
	docker compose -f docker-compose.dev.yml down

cipher-test:
	docker exec -it apache-benchmark-server ab -n 1000 -c $(c) -p data/data-cifrar.json -T application/json -rk http://api:5000/cipher

decipher-test:
	docker exec -it apache-benchmark-server ab -n 1000 -c $(c) -p data/data-descifrar.json -T application/json -rk http://api:5000/decipher

