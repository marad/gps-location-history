module CmdArgs(
    CliArgs, 
    startApplication,
    argRegionsFile
    ) where

import System.Console.ArgParser
import Data.Text.Lazy as T
    
data CliArgs = CliArgs {
    regions :: String
} deriving (Show)

argRegionsFile :: CliArgs -> Text
argRegionsFile = T.pack . regions

startApplication :: (CliArgs -> IO ()) -> IO ()
startApplication func = do 
    interface <- appInterface
    runApp interface func

appInterface :: IO (CmdLnInterface CliArgs)
appInterface =
    (`setAppDescr` "GPS logs processing")
    <$> mkApp regionsParser

regionsParser :: ParserSpec CliArgs 
regionsParser =  CliArgs `parsedBy` optFlag "regions.json" "regions"
