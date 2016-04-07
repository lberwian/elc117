import Data.Char

--1
addSuffix :: String -> [String] -> [String]
addSuffix str strlist = [x ++ str | x <- strlist]
--2
countShorts :: [String] -> Int
countShorts [] = 0
countShorts (x:xs) = if length x < 5 then (countShorts xs)+ 1 else countShorts xs
--3
countShortsList :: [String] -> Int
countShortsList list = length [x | x <- list, length x < 5]

--4
ciclo :: Int -> [Int] -> [Int]
ciclo 0 _ = []
ciclo n list =  list++[]++ciclo (n-1) list
--5
numera :: [String] -> [(Int, String)]
numera [] = []
numera (x:xs) = numera (init (x:xs)) ++ [(length (x:xs), if (length xs) == 0  then x else last xs)]

--6 a)

--[ (x,y) | x <- [1..5], even x, y <- [(x + 1)..6], odd y ]
-- Em x <- [1..5], even x: Seleciona os números com a condição de estar entre 1 e 5 e ser par, para pertencer a  x.
-- Em y <- [(x+1)..6] odd y: Seleciona os números com a condição de estar entre x+1 e 6 e ser impar, para pertencer a y. x nesse caso é o(s) número(s) da lista gerada em x <- [1..5], even x.
-- Gerado uma lista com dois valores em x <- [1..5], even x, x <- [2,4]
-- Com x=2 foi gerado uma lista com dois valores em y <- [(x+1)..6] odd y, y <- [3,5], logo a combinação [(2,3),(2,5)]
-- Com x=4 foi gerado uma lista com um valor em y <- [(x+1)..6] odd y, y <- [5], logo a combinação [(4,5)]
-- A lista de compreensão é [(2,3),(2,5),(4,5)].

--b) 

-- a ++ b: ++ aponta a operação de concatenação de duas strings [char], que seria a e b
-- a <- ["lazy","big"]:  ["lazy","big"] pertence a a
-- b <- ["frog", "dog"]: ["frog", "dog"] pertence a b
-- A primeiro elemento "a", da lista ["lazy","big"] "lazy" concatenará (++) com o primeiro elemento da lista "b" ["frog", "dog"] "frog", a = "lazy" b = "frog", a ++ b, "lazy" ++ "frog" = "lazyfrog"
-- Todos elementos de a com todos de b (nessa ordem), 1º elemento de "a" com 2º de "b", 2º de "a" com 1º de "b" e por final 2º de "a" com 2º de "b".
-- ["lazyfrog","lazydog","bigfrog","bigdog"]

--c)
--concat [ [a,'-'] | a <- "paralelepipedo", not (elem a "aeiou")]
--concat: concatena uma lista de listas, usado nesse caso em uma lista de lista de char, [[Char]]
--[a,'-']: a é o primeiro elemento da lista de char, '-' o segundo, o terceiro é o segundo elemento da lista de char, '-' o quarto, e assim por diante.
-- a <- "paralelepipedo": Cada elemento de ['p','a','r','a','l','e','l','e','p','i','p','e','d','o'], pertence a a dependendo das condições.
-- Elem:recebe um elemento e devolve True se estiver na lista ou False se não, 
-- not:: Bool -> Bool, recebe True devolve False, recebe False devolve True.
-- Quando o elemento a é verificado pelas condição e recebe False, ele não pertence a lista, como qualquer outra condição.
-- No caso de not (elem a "aeiou"), not é utilizado para exatamente não adicionar os elementos encontrados na lista de vogais, se a for vogal em (elem a) retornaria True, o que faria uma lista com apenas as vogais encontradas na lista de char sem um not. Mas como a condição não é essa, not é usado e então o resultado é inverso, pois seria False nesse caso.
-- Concat [['p','-'],['r','-'],['l','-'],...] = "p-r-l-l-p-p-d-" ou ['p','-','r','-','l','-',...]


--7

crossProduct :: [a] -> [b] -> [(a,b)]
crossProduct  [] _ = []
crossProduct (x:xs) y = pairWithALL x y++crossProduct xs y 

pairWithALL :: a -> [b] -> [(a,b)]
pairWithALL _ [] = []
pairWithALL a (x:xs) = (a,x):pairWithALL a xs

--8

genRects :: Int -> (Int,Int) -> [(Float,Float,Float,Float)]
genRects n (x,y) = [(x ,fromIntegral y, w, h) | x <- [fromIntegral x, fromIntegral x+h..fromIntegral x +(fromIntegral (n-1)*h)] ] 
		 where	 w = 5.5
			 h = 5.5
--9
func :: [(Int,Int)] -> ([Int],[Int])
func x = (funcfst x++[],funcsnd x++[]) 

funcfst :: [(Int,Int)] -> [Int]
funcfst [] = []
funcfst (x:xs) = fst x:[]++funcfst xs

funcsnd :: [(Int,Int)] -> [Int]
funcsnd [] = []
funcsnd (x:xs) = snd x:[]++funcsnd xs 

--10

funclist :: [(Int, Int)] -> ([Int],[Int])
funclist list = ([ fst x| x <- list],[snd x | x <- list]) 

--11
funcOrdem :: [(Int, Int)] -> ([Int],[Int])
funcOrdem x = ( map fst x , map snd x)

--12

cpfAux :: [Int] -> Int
cpfAux x =  if expr < 2 then 0 else 11-expr 
	where
	 expr = (sum $ zipWith (*) x [(length x)+1,length x..2]) `mod` 11

isCpfOk :: [Int] -> Bool
isCpfOk cpf = 
	
	let 
	div1 = cpfAux (take 9 cpf)	
	in div1 == cpf !! 9 && cpfAux ((take 9 cpf) ++ [div1]) == cpf !! 10

main = do
  let cpf = "12345678909"
      digitos = (map digitToInt cpf)
      result = isCpfOk digitos
  putStrLn (show result)

