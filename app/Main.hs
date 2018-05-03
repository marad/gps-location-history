module Main where

import Lib ()
import Input
import CmdArgs
import RegionsReader
import App.SpanCalculator

import System.IO (hPutStrLn, stderr)
import Data.Either (rights, lefts)

main :: IO ()
main = startApplication makeMagic

makeMagic :: CliArgs -> IO ()
makeMagic args = do
    eitherRegions <- readRegions $ argRegionsFile args
    case eitherRegions of 
        Right regions ->  do
            print regions
            parsingResult <- readEntriesFromStdin

            let parsingErrors = lefts parsingResult
            let entries = rights parsingResult
            let spans = calculateSpans regions entries

            hPutStrLn stderr $ showLines parsingErrors
            Prelude.putStrLn $ showLines spans
        Left parsingError ->
            hPutStrLn stderr $ show parsingError
    return ()

showLines :: Show a => [a] -> String
showLines = Prelude.foldl (\acc x -> acc ++ "\n" ++ show x) ""
