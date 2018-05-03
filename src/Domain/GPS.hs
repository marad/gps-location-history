module Domain.GPS where

import qualified Geo.Computations as Geo
import Geo.Types

class GPSPoint a where
    toPoint :: a -> Point

distance :: (GPSPoint a, GPSPoint b) => a -> b -> Double
distance e1 e2 = Geo.distance (toPoint e1) (toPoint e2)

