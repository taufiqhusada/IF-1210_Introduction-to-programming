-- Taufiq Husada Daryanto
-- 16518238
-- 20 Februari 2019

module CountStartEnd where

countStartEnd :: [Int] -> Int -> Int
countBack :: [Int] -> Int-> Int
countFront :: [Int] -> Int -> Int

countBack l cnt
	|null l = 0
	|cnt==0 = 0
	|otherwise = last l + countBack (init l) (cnt-1)
	
countFront l cnt
	|null l = 0
	|cnt==0 = 0
	|otherwise = head l + countFront (tail l) (cnt-1)
	
countStartEnd l cnt
	|2*cnt >= length l = sum l
	|otherwise = (countBack l cnt) + (countFront l cnt)
	
	
