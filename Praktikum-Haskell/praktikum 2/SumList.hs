-- Taufiq Husada Daryanto
-- 16518238
-- 20 Februari 2019

module SumList where

sumList :: [Int] -> Int

sumList l 
	|null l = 0
	|otherwise = head l + sumList (tail l)
