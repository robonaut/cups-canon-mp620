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
$ lp -o MediaType=PhotoPlusGloss2 -o InputSlot=Rear -o PageSize=Custom.4x6in -o StpFullBleed=True -o StpiShrinkOutput=Expand [filename].pdf
```

## Command line A4 PDF print
```sh
$ lp [filename].pdf
```

## Install scanner
Install drivers for the (MP280)[https://nl.canon.be/support/consumer_products/products/fax__multifunctionals/inkjet/pixma_mp_series/pixma_mp280.html?type=drivers&driverdetailid=tcm:43-2225643&os=macos%2012%20%28monterey%29&language=nl] to gain native scanning capabilities
