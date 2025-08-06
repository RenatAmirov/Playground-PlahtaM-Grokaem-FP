module RnxLib
    ( someFunc
    ) where

import TipCalculator

someFunc :: IO ()
someFunc = putStrLn (show (getDiscountPercentage ["Саша", "Book", "Маша"]))
--someFunc = putStrLn (show (getTipPercentage ["Саша", "Маша"]))
--someFunc = putStrLn "someFunc"

