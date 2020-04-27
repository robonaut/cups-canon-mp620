docker rm -f print || true
docker build -f ./Dockerfile -t print .

docker run -d -p 6310:631 --name print print
docker exec print lpadmin -p canon -E -v bjnp://192.168.0.143:8611 -m gutenprint.5.3://bjc-MULTIPASS-MP620/expert
docker exec print lpadmin -d canon
docker exec -it print bash
