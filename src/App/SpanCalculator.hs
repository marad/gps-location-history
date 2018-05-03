module App.SpanCalculator where

import Domain.Entry
import Domain.Region
import Domain.Span

-- Pomysły na dodatkowe ficzery:
-- * restLocations - pozwala znaleźć miejsca, w których 
--   przez jakiś czas nie było ruchu


calculateSpans :: [Region] -> [Entry] -> [Span]
calculateSpans regions = map makeSpan
                    . groupEntriesByRegion
                    . map (assignRegion regions)
                    . sortEntriesByTime

makeSpan :: (Maybe Region, [Entry]) -> Span
makeSpan (region, entries) = Span {
    region = region,
    entries = entries,
    enterTime = time $ Prelude.head entries,
    leaveTime = time $ Prelude.last entries
}