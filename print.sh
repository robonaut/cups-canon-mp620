# ensure files directory exists
mkdir -p files

# remove running instance
docker rm -f print || true

# build new image based in Dockerfile
docker build -f ./Dockerfile -t print .

# Run this new image and forward cups port and avahi ports
docker run -d -p 6310:6310 --name print print

# Start dbus service
docker exec print service dbus start

# Start avahi service
docker exec print service avahi-daemon start

# Add canon network printer with bjnp backend
docker exec print lpadmin -p canon -E -v bjnp://192.168.0.100:8611 -m gutenprint.5.3://bjc-MULTIPASS-MP620/expert

# Make this the default printer
docker exec print lpadmin -d canon

# Share this printer
docker exec print lpadmin -p canon -o printer-is-shared=true

# Open bash session in new container
docker exec -it print bash
