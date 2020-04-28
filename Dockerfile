FROM ubuntu:20.04

WORKDIR /app

COPY entrypoint.sh entrypoint.sh

RUN apt-get update

RUN apt-get install -y tzdata

RUN dpkg-reconfigure --frontend noninteractive tzdata

RUN apt-get install -y \
  sudo \
  whois \
  curl \
  cups \
  cups-client \
  cups-backend-bjnp \
  cups-bsd \
  cups-filters \
  printer-driver-all \
  smbclient \
  avahi-daemon \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

# Add user and disable sudo password checking
RUN useradd \
  --groups=sudo,lp,lpadmin \
  --create-home \
  --home-dir=/home/print \
  --shell=/bin/bash \
  --password=$(mkpasswd print) \
  print \
&& sed -i '/%sudo[[:space:]]/ s/ALL[[:space:]]*$/NOPASSWD:ALL/' /etc/sudoers

COPY cupsd.conf /etc/cups/cupsd.conf

COPY files files

RUN chmod +x entrypoint.sh

# Default shell
CMD ["/usr/sbin/cupsd", "-f"]

ENTRYPOINT ["/app/entrypoint.sh"]