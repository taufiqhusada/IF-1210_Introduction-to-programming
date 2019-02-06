-- Taufiq Husada Daryanto
-- 16518238
-- 6 Februari 2019

-- konvensi suhu dari celcius ke temperatur lain

module KonversiSuhu where

konversiSuhu :: Float -> Char -> Float

konversiSuhu suhu jenis 
	|(jenis=='R') = (4/5)*suhu
	|(jenis=='F') = (9/5*suhu)+32
	|(jenis=='K') = suhu + 273.15
	|otherwise = suhu 


