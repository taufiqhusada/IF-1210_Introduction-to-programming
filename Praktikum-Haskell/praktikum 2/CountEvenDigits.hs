-- Taufiq Husada Daryanto
-- 16518238
-- 20 Februari 2019

module CountEvenDigits where

countEvenDigits :: Int -> Int

countEvenDigits x
	|(x<10) = if (mod x 2 == 0) then 1 else 0
	|otherwise = (if (mod (mod x 10) 2 == 0) then 1 else 0) + countEvenDigits (div x 10)

