module TestRegions where

import Domain.Region

hospital :: Region
hospital = Region {
    name = "Hospital",
    regionLon = 53.028530,
    regionLat = 18.581256,
    radius = 100
}

copernicus :: Region
copernicus = Region {
    name = "Copernicus Shopping Center",
    regionLon = 53.025406,
    regionLat = 18.638269,
    radius = 100
}

intermarche :: Region
intermarche = Region {
    name = "Intermarche",
    regionLon = 53.041979,
    regionLat = 18.598365,
    radius = 100
}

regions :: [Region]
regions = [hospital, copernicus, intermarche]
