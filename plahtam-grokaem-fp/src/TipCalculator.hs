module TipCalculator 
    ( 
        getTipPercentage, 
        getDiscountPercentage, 
        rnxIncrement, 
        rnxAdd, 
        rnxRemoveChar,
        rnxWordScore,
        firstChar,
        replan,
        main2
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

getDiscountPercentage :: [String] -> Int
getDiscountPercentage items
    | "Book" `elem` items = 5
    | otherwise           = 0

rnxIncrement :: Int -> Int
rnxIncrement x = x + 1

rnxAdd :: Int -> Int -> Int
rnxAdd a b = a + b

rnxRemoveChar :: Char -> String -> String
rnxRemoveChar = filter . (/=)

rnxWordScore :: String -> Int
rnxWordScore word = length $ rnxRemoveChar 'a' word

firstChar :: String -> Char
firstChar (x:_) = x
firstChar []    = ' '

------------------------------------------------------

replan :: Eq a => [a] -> a -> a -> [a]
replan [] _ _ = []  -- Пустой список остаётся пустым
replan lst newCity target = 
  let (prefix, suffix) = break (== target) lst  -- Разделяем список на часть до цели и остаток
  in case suffix of
      []      -> lst  -- Если цель не найдена, возвращаем исходный список
      (x:xs) -> prefix ++ [newCity] ++ suffix  -- Вставляем новый элемент перед целью

main2 :: IO ()
main2 = do
  let planA = ["Paris", "Berlin", "Kraków"]
      planB = replan planA "Vienna" "Kraków"
      planC = replan planA "Prague" "Warsaw"  -- Тест: цель не найдена
  putStrLn $ "Plan B: " ++ show planB
  putStrLn $ "Plan C: " ++ show planC

  ---------------------------------------------------------

