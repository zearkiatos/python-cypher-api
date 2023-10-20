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

docker-up:
	docker compose up --build

docker-down:
	docker compose down

cipher-test:
	docker exec -it apache-benchmark-server ab -n 1000 -c $(c) -p data/data-cifrar.json -T application/json -rk $(base_url)/cipher
	docker exec -it apache-benchmark-server ab -n 1000 -c $(c) -p data/data-cifrar.json -T application/json -rk -g /home/data/reports/output.csv $(base_url)/cipher
	docker exec -it apache-benchmark-server touch data/reports/plot.p
	docker exec -it apache-benchmark-server sh -c 'echo "set terminal png size 600" > data/reports/plot.p'
	docker exec -it apache-benchmark-server sh -c 'echo "set output \"/home/data/reports/report.png\"" >> data/reports/plot.p'
	docker exec -it apache-benchmark-server sh -c 'echo set "title \"1000 request, $(c) request concurrencies\"" >> data/reports/plot.p'
	docker exec -it apache-benchmark-server sh -c 'echo "set size ratio 0.6" >> data/reports/plot.p'
	docker exec -it apache-benchmark-server sh -c 'echo "set grid y" >> data/reports/plot.p'
	docker exec -it apache-benchmark-server sh -c 'echo "set xlabel \"Numbers of requests\"" >> data/reports/plot.p'
	docker exec -it apache-benchmark-server sh -c 'echo "set ylabel \"Response time (ms)\"" >> data/reports/plot.p'
	docker exec -it apache-benchmark-server sh -c 'echo "plot \"output.csv\" using 9 smooth sbezier with lines title \"$(base_url)/cipher\"" >> data/reports/plot.p'
	docker exec -it apache-benchmark-server sh -c 'gnuplot /home/data/reports/plot.p'

decipher-test:
	docker exec -it apache-benchmark-server ab -n 1000 -c $(c) -p data/data-cifrar.json -T application/json -rk $(base_url)/decipher
	docker exec -it apache-benchmark-server ab -n 1000 -c $(c) -p data/data-cifrar.json -T application/json -rk -g /home/data/reports/output.csv $(base_url)/cipher
	docker exec -it apache-benchmark-server touch data/reports/plot.p
	docker exec -it apache-benchmark-server sh -c 'echo "set terminal png size 600" > data/reports/plot.p'
	docker exec -it apache-benchmark-server sh -c 'echo "set output \"/home/data/reports/report_decipher.png\"" >> data/reports/plot.p'
	docker exec -it apache-benchmark-server sh -c 'echo set "title \"1000 request, $(c) request concurrencies\"" >> data/reports/plot.p'
	docker exec -it apache-benchmark-server sh -c 'echo "set size ratio 0.6" >> data/reports/plot.p'
	docker exec -it apache-benchmark-server sh -c 'echo "set grid y" >> data/reports/plot.p'
	docker exec -it apache-benchmark-server sh -c 'echo "set xlabel \"Numbers of requests\"" >> data/reports/plot.p'
	docker exec -it apache-benchmark-server sh -c 'echo "set ylabel \"Response time (ms)\"" >> data/reports/plot.p'
	docker exec -it apache-benchmark-server sh -c 'echo "plot \"output.csv\" using 9 smooth sbezier with lines title \"$(base_url)/decipher\"" >> data/reports/plot.p'
	docker exec -it apache-benchmark-server sh -c 'gnuplot /home/data/reports/plot.p'

docker-gunicorn:
	gunicorn --bind 0.0.0.0:$(port) app:app

