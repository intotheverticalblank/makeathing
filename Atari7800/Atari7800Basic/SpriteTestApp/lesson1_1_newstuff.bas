  
 incgraphic g8x8_4color2.png 160A
 incgraphic g8x8_4color3.png 160A
 incgraphic g8x8_4color4.png 160A 
  
  rem draw sprites with animation and no bg
_screen4_setup
 m = 0  
 n = 0
 c = 0
 f = 0
 
_screen4
 clearscreen
 y = 0
 x = 0 
 c = 0
 for i = 0 to n
   for j = 0 to m
    plotsprite  g8x8_4color c x y f 
    x = x + 8
  next 
  x = 0
  y = y + 8 
  c = c + 1    
  if c > 6 then c = 0
 next
 if w > 20 && joy0right then w =0 : m = m + 1
 if w > 20 && joy0down then w = 0 : n = n + 1
 if w > 20 && joy0left then w =0 :  m = m - 1
 if w > 20 && joy0up then w = 0 :  n = n - 1
 if w > 20 && joy0fire then w = 0 : goto _screen4
 w = w + 1
 f = f + 1
 if f > 3 then f = 0
 if n > 24 then n = 0
 if m > 20 then m = 0
 plotchars 'rt dn to ad lf up to dl fr to ct' 7 10 23 1
 drawscreen
 goto _screen4