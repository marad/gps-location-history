module Input(readEntriesFromStdin) where

import GHC.Generics
import Lib()
import Data.Text.Lazy as T
import Data.Text.Lazy.Encoding (encodeUtf8)
import Data.Aeson
import qualified Data.Aeson as JS
import Control.Arrow as Arrow

import Domain.Entry

import Tools (readUtcTime)

readEntriesFromStdin :: IO [Either Text Entry]
readEntriesFromStdin =
    Prelude.map (Arrow.right fromDto . asLogDto) . T.lines . T.pack 
    <$> Prelude.getContents

data LogDto = LogDto {
    tid :: Text,
    acc :: Double,
    lat :: Double,
    lon :: Double,
    tst :: Int
} deriving (Generic)

instance FromJSON LogDto

asLogDto :: Text -> Either Text LogDto
asLogDto x =  Arrow.left T.pack $ JS.eitherDecode (encodeUtf8 x)

fromDto :: LogDto -> Entry
fromDto dto = Entry {
    deviceName = tid dto,
    accuracy = acc dto,
    entryLat = lat dto,
    entryLon = lon dto,
    epochTime = tst dto,
    time = readUtcTime $ tst dto
}
