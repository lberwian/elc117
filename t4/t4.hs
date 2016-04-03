import Text.Printf

type Point     = (Float,Float)
type Rect      = (Point,Float,Float)

maxWidth :: Float
maxWidth = 1000

maxHeight :: Float
maxHeight = 100

-- Gera um unico retangulo SVG 
-- a partir de coordenadas+dimensoes e de uma string com atributos de estilo
writeRect :: (Rect,String) -> String 
writeRect (((x,y),w,h),style) = 
  printf "<rect x='%.3f' y='%.3f' width='%.2f' height='%.2f' style='%s' />\n" x y w h style

-- Gera codigo-fonte de arquivo SVG 
-- concatenando uma lista de retangulos e seus atributos de estilo
writeAllRects :: Float -> Float -> [(Rect,String)] -> String 
writeAllRects w h rs = 
  printf "<svg width='%.2f' height='%.2f' xmlns='http://www.w3.org/2000/svg'>\n" w h 
      ++ (concat (map writeRect rs)) ++ "</svg>"

-- TO-DO
-- Esta funcao deve gerar n retangulos de largura w e altura h.
genRects :: Float -> Float -> Float -> [Rect]
genRects 0 _ _ = []
genRects n w h = [((((n*w)-w),0.0),w,h)] ++ (genRects (n-1) w h) 

--genRects n w h = [((0.0,0.0), w, h)] -- Lista com somente um retangulo. 

-- Se houverem mais retangulos que cores, havera retangulos com cores repetidas. -- Se houverem menos retangulos que cores, algumas cores nao serao usadas.
applyStyles :: [String] -> [Rect] -> [(Rect,String)] 
applyStyles _ [] = []
applyStyles (s:ss) (x:xs) = (x,s):applyStyles (ss++(s:[])) xs

-- Combina (zip) a lista de estilos com a lista de retangulos, aplicando os estilos ciclicamente.
--applyStyles styles rects = zip rects (cycle styles)

--Gera cores para os retangulos de acordo com o valores RGB da lista de tuplas [(Int,Int,Int)], O tom das cores muda n vezes somando shift sobre os valores RGB. OBS: Qualquer valor Int é aceito, mas o range de cores R,G e B é de 0 a 255
styles ::  Int -> Int -> [(Int,Int,Int)] -> [String]
styles _ 0 _ = []
styles shift n (x:xs) = ["fill:rgb"++(show x),"fill:rgb"++(show xs)]++[]++ styles shift (n-1) (map (shiftTupleRGB shift)(x:xs)) 
--Shift na tupla RGB
shiftTupleRGB :: Int -> (Int,Int,Int) -> (Int, Int, Int)
shiftTupleRGB n (a,b,c) = (a+n,b+n,c+n)
{--
     O codigo abaixo gera um arquivo "mycolors.svg".
     A geracao usa 2 listas: uma com coordenadas dos retangulos e outra com as cores.
     Essas 2 listas sao combinadas numa lista resultante, que e' escrita no arquivo.
 --}
main :: IO ()
main = do
  let
   rects = genRects 10 50 50                          -- Deve gerar 10 retangulos de 50x50
   -- styles = ["fill:rgb(140,0,0)","fill:rgb(0,140,0)"] -- Estilo: vermelho e verde
   rectstyles = applyStyles (styles 0 10 [(50,3,900),(1,135,100)]) rects --  OBS: Qualquer valor Int é aceito, mas o range de cores R,G e B é de 0 a 255 em styles.
  writeFile "mycolors.svg" (writeAllRects maxWidth maxHeight rectstyles)
