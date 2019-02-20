-- Taufiq Husada Daryanto
-- 16518238
-- 20 Februari 2019

module NbKelipatanX where

nbKelipatanX :: Int -> Int -> Int ->Int

nbKelipatanX l r m 
	|l==r = if (mod l m == 0 ) then 1 else 0
	|otherwise = (if (mod r m ==0) then 1 else 0) + nbKelipatanX l (r-1) m
	
	
