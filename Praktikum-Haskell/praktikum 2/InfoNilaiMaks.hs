-- Taufiq Husada Daryanto
-- 16518238
-- 20 Februari 2019

module InfoNilaiMaks where

infoNilaiMaks :: [Int] -> (Int,Int)
cariMax :: [Int] -> Int
cariLulus :: [Int] -> Int
max2 :: Int -> Int -> Int

max2 a b = if (a>b) then a else b

cariMax l 
	|null l = 0
	|otherwise = max2 (head l) (cariMax (tail l))
	
cariLulus l
	|null l = 0
	|otherwise = (if (head l >= 75) then 1 else 0) + cariLulus (tail l)
	
infoNilaiMaks l = (cariLulus l, cariMax l)

