-- Taufiq Husada Daryanto
-- 16518238
-- 20 Februari 2019

module HapusElemenX where

hapusElemenX :: [Int] -> Int -> [Int]

hapusElemenX l x
	|null l = []
	|(head l == x) = hapusElemenX (tail l) x
	|otherwise = [head l] ++ hapusElemenX (tail l) x
