somaQuad :: Int -> Int -> Int
somaQuad x y =(x^2)+(y^2)

hasEqHeads :: [Int] -> [Int] -> Bool
hasEqHeads l1 l2 = head l1 == head l2

srStr :: [String] -> [String]
srStr str = map ("Sr. "++) str

espCont :: String -> Int
espCont str =  length (filter (==' ')(str))

calcList :: [Float] -> [Float]   
calcList n = map (\x->3*x^2+2/x+1) n

negList :: [Float] -> [Float]
negList n = filter (<0) n

umCem :: [Float] -> [Float]
umCem n = filter (\n-> n>1 && n<100) n

setIdade :: [Int] -> [Int]
setIdade n = filter  (\x->2016-x> 1970) n

numPar :: [Int] -> [Int]
numPar n = filter even n
 
charFound :: Char -> String -> Bool
charFound c str = length (filter(==c)str) > 0

