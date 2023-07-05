DOCKER_VEGETA=peterevans/vegeta:latest

DURACION=5s
PETICIONES_POR_SEGUNDO=5000
HILOS=10


docker run --rm --network host -v $(pwd):/home --workdir /home $DOCKER_VEGETA sh -c "\
    vegeta attack -insecure -targets=targets.txt -workers=$HILOS -rate=$PETICIONES_POR_SEGUNDO -duration=$DURACION > results.gob && \
    vegeta report results.gob > results.txt && \
    vegeta plot results.gob > plot.html && \
    rm results.gob
"

