# cups-canon-mp620
Docker container to print files to a legacy Canon MP620 printer

## Run print server
```sh
$ ./print.sh
```

This will create an ubuntu based cups server with support for old Canon printers

## Install networked printer using IPP
Point host to `localhost:6310` and use `printers/canon` as queue name

## Cups admin web interface
Browse to http://127.0.0.1:6310

## Command line photo print
```sh
$ lp -o MediaType=PhotoPlusGloss2 -o InputSlot=Rear -o PageSize=Custom.4x6in -o StpFullBleed=True [filename].pdf
```
