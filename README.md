# gps-location-history

This project analyses the GPS location history, and groups them in named regions so you can 
see where and for how long you've been.

## Usage

### Input data

gps-location-history reads data from stdin, and each line must be a JSON object containing
the following fields:

- lat - latitude
- lon - longitude
- tst - timestamp in seconds
- acc - gps accuracy (currently unused, but required)
- tid - device id (currently unused, but required)

So the example line could look like this:

```json
{"lat":11.111111,"lon":22.222222,"acc":39,"tid":"generic","tst":1234567890}
```

### Regions definitions

To group entries in regions you also need to define those regions. By default
gps-location-history tries to find the file `regions.json` located in current
working directory, but you can also select different file using the 
`-r other-regions.json` command line switch.

Regions are simple definitions of circles on a map, so you have to provide its
name, center and radius like so:

```json
[
    {
        "name": "Hospital",
        "regionLon": 53.028530,
        "regionLat": 18.581256,
        "radius": 100
    },
    {
        "name": "Copernicus Shopping Center",
        "regionLon": 53.025406,
        "regionLat": 18.638269,
        "radius": 100
    },
    {
        "name": "Intermarche",
        "regionLon": 53.041979,
        "regionLat": 18.598365,
        "radius": 100
    }
]
```

### Output

The output look like this:

```
Home
        Enter: 2018-05-03 03:21:50 UTC
        Leave: 2018-05-03 11:37:36 UTC
        Time spent: 29746s      Hours: 8h
Work
        Enter: 2018-05-03 11:58:16 UTC
        Leave: 2018-05-03 13:39:41 UTC
        Time spent: 6085s       Hours: 1h
Home
        Enter: 2018-05-03 13:59:46 UTC
        Leave: 2018-05-03 14:21:22 UTC
        Time spent: 1296s       Hours: 0h
```

One thing to note here is that it groups together entries sorted by time.
So if you were home in the morning, then at work and back at home it will
show you exactly that.


## Build & Install from source

This project uses Haskell Stack so if you already have Stack and Cabal installed, just type:

> stack build

After that you can do `stack install` to install it in your _~/.local/bin_.
