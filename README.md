# cups-canon-mp620
Docker container to print files to a legacy Canon MP620 printer

## Run print server
```sh
$ ./print.sh
```

This will create an ubuntu based cups server with support for old Canon printers

## Install networked printer using IPP
Point host to `localhost:6310` and user `printers/canon` as queue name
