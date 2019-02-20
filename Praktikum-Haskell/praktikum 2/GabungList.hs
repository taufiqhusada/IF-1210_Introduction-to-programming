-- Taufiq Husada Daryanto
-- 16518238
-- 20 Februari 2019

module GabungList where

gabungList :: [Int] -> [Int] -> [Int]

hapusElemenX :: [Int] -> Int -> [Int]

cariMin :: [Int] -> Int

min2 :: Int -> Int -> Int

sortList :: [Int] -> [Int]

min2 a b = if (a<b) then a else b

cariMin l
	|null l = 99999999999
	|otherwise = min2 (head l) (cariMin (tail l))

hapusElemenX l x
	|null l = []
	|(head l == x) = hapusElemenX (tail l) x
	|otherwise = [head l] ++ hapusElemenX (tail l) x
	
sortList l 
	|null l = []
	|otherwise = 
		let minima = cariMin l
		in [minima] ++ sortList (hapusElemenX l minima)


gabungList a b
	|(null a) && (null b) = []
	|(null a) && not (null b) = sortList b
	|not (null a) && (null b) = sortList a
	|otherwise =
		let (mina,minb) = (cariMin a,cariMin b)
		in if (minb < mina) then [minb] ++ gabungList a (hapusElemenX b minb) else [mina] ++ gabungList (hapusElemenX a mina) b
