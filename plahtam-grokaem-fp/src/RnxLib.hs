module RnxLib
    ( someFunc
    ) where

import TipCalculator

someFunc :: IO ()
someFunc = putStrLn (show (getTipPercentage ["Саша", "Маша"]))
--someFunc = putStrLn "someFunc"

