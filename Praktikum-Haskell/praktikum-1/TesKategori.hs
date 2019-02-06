
-- Taufiq Husada Daryanto
-- 16518238
-- 6 Februari 2019

module TesKategori where

cek1 :: Int -> Int -> Bool
cek2 :: Int -> Int -> Bool
cek3 :: Int -> Int -> Bool
cek4 :: Int -> Int -> Bool
tesKategori :: Int -> Int -> Int -> Bool

cek1 t b = if ((t<=100)&&(b<=150)) then True else False
cek2 t b = if ((t<=200)&&(b>30)) then True else False
cek3 t b = if ((t>100)&&(t<=200)&&(b>150)) then True else False
cek4 t b = if ((t>100)&&(b<=150)) then True else False

tesKategori t b k 
	|(k==1) = cek1 t b
	|(k==2) = (cek2 t b) || (cek4 t b)
	|(k==3) = (cek3 t b) || (cek4 t b)
	|(k==4) = cek4 t b 
	|otherwise = if ((t>200)&&(b>150)) then True else False
