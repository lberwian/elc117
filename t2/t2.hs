--1
somaQuad :: Int -> Int -> Int
somaQuad x y =(x^2)+(y^2)
--2
hasEqHeads :: [Int] -> [Int] -> Bool
hasEqHeads l1 l2 = head l1 == head l2
--3
srStr :: [String] -> [String]
srStr str = map ("Sr. "++) str
--4
espCont :: String -> Int
espCont str =  length (filter (==' ')(str))
--5
calcList :: [Float] -> [Float]   
calcList n = map (\x->3*x^2+2/x+1) n
--6
negList :: [Float] -> [Float]
negList n = filter (<0) n
--7
umCem :: [Float] -> [Float]
umCem n = filter (\n-> n>1 && n<100) n
--8
setIdade :: [Int] -> [Int]
setIdade n = filter  (\x->2016-x> 1970) n
--9
numPar :: [Int] -> [Int]
numPar n = filter even n
--10
charFound :: Char -> String -> Bool
charFound c str = length (filter(==c)str) > 0
--11
--Ele faz uma varredura na lista ou string até se deparar com a condição determinada e escreve numa lista ou numa string 
--o que vem antes (prefixo)


