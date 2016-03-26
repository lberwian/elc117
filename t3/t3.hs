--1
listQuad :: [Int] -> [Int]
listQuad []=[] 
listQuad (x:xs) = x^2 : listQuad  xs
--2
nomeSr :: [String] -> [String] 
nomeSr [] = []
nomeSr (x:xs)=  ("Sr. "++ x): nomeSr xs
--3
numEsp :: String -> Int
numEsp [] = 0
numEsp (x:xs) = if x /= ' ' then numEsp xs else numEsp (xs) + 1
--4
calcLis :: [Float] -> [Float]
calcLis [] = []
calcLis (x:xs) = 3*x^2+2/x:calcLis xs  
--5
negList :: [Float] -> [Float]
negList [] = []
negList (x:xs) = if x < 0 then x:negList xs else negList xs
--6
remVogal :: String -> String
remVogal x = filter (\x -> x/='a' && x/='e' && x/='i' && x/='o' && x/='u' && x/='A' && x/='E'&& x/= 'I' && x/='O' && x/='U') x 
--7
remVogalrec :: String -> String 
remVogalrec [] = []
remVogalrec (x:xs)
	|x== 'a' = remVogalrec xs
	|x== 'e' = remVogalrec xs
	|x== 'i' = remVogalrec xs
	|x== 'o' = remVogalrec xs
	|x== 'u' = remVogalrec xs
	|x== 'A' = remVogalrec xs
	|x== 'E' = remVogalrec xs
	|x== 'I' = remVogalrec xs
	|x== 'O' = remVogalrec xs
	|x== 'U' = remVogalrec xs
	|otherwise = x:remVogalrec xs
--8
hifPut :: String -> String
hifPut x = map (\x -> if x == ' ' then ' ' else '-') x
--9
hifPutrec :: String -> String
hifPutrec [] = []
hifPutrec (x:xs)
	|x== ' ' = x:hifPutrec xs
	|otherwise ='-':hifPutrec xs
	
--10
charFound :: Char -> String -> Bool
charFound c  [] = False
charFound c (x:xs) = if c==x then True else charFound c xs
--11
translate :: [(Float,Float)] -> [(Float, Float)]
translate [] = []
translate (x:xs) = (\x-> (fst x+2.0, snd x+2.0))x:translate xs   
--12
prodVet :: [Int] -> [Int] -> [Int]
prodVet [] [] = []
prodVet	x [] = []
prodVet [] y = []
prodVet (x:xs) (y:ys)= x*y:prodVet xs ys
--13
prodVetnr :: [Int] -> [Int] -> [Int]
prodVetnr x y= zipWith (*) x y
--14
geraTabela :: Int -> [(Int,Int)]
geraTabela 0 = []
geraTabela x =geraTabela (x-1)++((x,x^2):[])
