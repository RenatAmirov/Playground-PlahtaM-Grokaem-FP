module TipCalculator 
    ( getTipPercentage
    )
    where

-- | Рассчитывает процент чаевых на основе количества имен в списке
-- Правила:
--   Пустой список      -> 0%
--   1-5 человек        -> 10%
--   6 и более человек  -> 20%
getTipPercentage :: [String] -> Int
getTipPercentage names = 
    case length names of
        0 -> 0
        n | n <= 5    -> 10
          | otherwise -> 20

-- Примеры использования:
--   getTipPercentage ["Саша", "Маша"]          -> 10
--   getTipPercentage ["Саша","Маша","Паша",..] -> 20 (6+ имен)
--   getTipPercentage (take 5 $ repeat "Имя")   -> 10
