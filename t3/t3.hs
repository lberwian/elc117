--1.(Recursiva) Recebe uma lista de números inteiros e produz uma lista de cada número elevado ao quadrado

listQuad :: [Int] -> [Int]
listQuad []=[]
listQuad (x:xs) = x^2 : listQuad  xs

--2.(Recursiva) Recebe uma lista de nomes e adiciona "Sr. " no início de cada nome

nomeSr :: [String] -> [String]
nomeSr [] = []
nomeSr (x:xs)=  ("Sr. "++ x): nomeSr xs

--3.(Recursiva) Recebe uma String e devolve o número de ' ' contidos

numEsp :: String -> Int
numEsp [] = 0
numEsp (x:xs) = if x /= ' ' then numEsp xs else numEsp (xs) + 1

--4.(Recursiva) Cada número de uma lista é calculado, 3*n^2+2/n+1.

calcLis :: [Float] -> [Float]
calcLis [] = []
calcLis (x:xs) = 3*x^2+2/x:calcLis xs

--5.(Recursiva) Seleciona números negativos de uma lista.

negList :: [Float] -> [Float]
negList [] = []
negList (x:xs) = if x < 0 then x:negList xs else negList xs

--6.(Não recursiva) Recebe uma String e retira suas vogais

remVogal :: String -> String
remVogal x = filter (\x -> x/='a' && x/='e' && x/='i' && x/='o' && x/='u' && x/='A' && x/='E'&& x/= 'I' && x/='O' && x/='U') x

--7.(Recursiva) == (7.)

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

--8.(Não-recursiva) Subsitui a String com '-', mantendo os ' '

hifPut :: String -> String
hifPut x = map (\x -> if x == ' ' then ' ' else '-') x

--9.(Recursiva) == (8.)

hifPutrec :: String -> String
hifPutrec [] = []
hifPutrec (x:xs)
        |x== ' ' = x:hifPutrec xs
        |otherwise ='-':hifPutrec xs

--10.(Recursiva) Verifica se o Char se encontra na String.

charFound :: Char -> String -> Bool
charFound c  [] = False
charFound c (x:xs) = if c==x then True else charFound c xs

--11.(Recursiva) Recebe uma lista de coordenadas 2D, e desloca os pontos em duas unidades

translate :: [(Float,Float)] -> [(Float, Float)]
translate [] = []
translate (x:xs) = (\x-> (fst x+2.0, snd x+2.0))x:translate xs

--12.(Recursiva) Recebe 2 listas, retorna uma lista contendo o produto, par a par, dos elementos  das listas de entrada.

prodVetrec :: [Int] -> [Int] -> [Int]
prodVetrec [] [] = []
prodVetrec x [] = []
prodVetrec [] y = []
prodVetrec (x:xs) (y:ys)= x*y:prodVet xs ys

--13.(Não-Recursiva) == (12.)

prodVet :: [Int] -> [Int] -> [Int]
prodVet x y= zipWith (*) x y

--14.(Recursiva) Recebe um número n e retorna uma tabela de números de 1 a n e seus quadrados, ex: geraTabela 5 resulta em [(1,1),(2,4),(3,9),(4,16),(5,25)]

geraTabela :: Int -> [(Int,Int)]
geraTabela 0 = []
geraTabela x =geraTabela (x-1)++((x,x^2):[])
