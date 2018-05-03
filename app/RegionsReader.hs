module RegionsReader(readRegions) where

import Domain.Region

import Data.Text.Lazy (Text)
import Data.Text.Lazy.Encoding (encodeUtf8)
import Control.Arrow as Arrow
import qualified Data.Text.Lazy as T
import qualified Data.Aeson as Aeson

instance Aeson.FromJSON Region

readRegions :: Text -> IO (Either Text [Region])
readRegions filePath = decodeRegions . T.pack <$> readFile (T.unpack filePath)

decodeRegions :: Text -> Either Text [Region]
decodeRegions x = Arrow.left T.pack $ Aeson.eitherDecode (encodeUtf8 x)