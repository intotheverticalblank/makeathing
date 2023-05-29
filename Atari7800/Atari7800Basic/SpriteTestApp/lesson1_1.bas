 set zoneheight 8
 displaymode 160A
 set plotvalueonscreen on
 set romsize 48k

 incgraphic g8x8_4color.png 160A
 incgraphic g8x8_4color2.png 160A
 incgraphic g8x8_4color3.png 160A
 incgraphic g8x8_4color4.png 160A 
 incgraphic zonebg80x16_8.png 160A
 incgraphic font.png 160A

 rem font
 alphachars '0123456789abcdefghijklmnopqrstuvwxyz>`?!/.,-_()[]&AB '
 characterset font

 rem blue
 P0C1=$90
 P0C2=$70
 P0C3=$98
 rem red
 P1C1=$20
 P1C2=$32
 P1C3=$36
 rem green
 P2C1=$C1
 P2C2=$C6
 P2C3=$CB
 rem purple
 P3C1=$50
 P3C2=$53
 P3C3=$58
 rem orange
 P4C1=$35
 P4C2=$38
 P4C3=$3C
 rem yellow
 P5C1=$15
 P5C2=$1A
 P5C3=$1E
 rem teal
 P6C1=$A1
 P6C2=$A6
 P6C3=$Ac
 rem white
 P7C1=$0F
 P7C2=$05
 P7C3=$09

 rem lesson 1
 w = 0
 z = 0




_title
 clearscreen
 plotchars 'demo 1' 7 67 10 1
 plotchars 'atari 7800 basic exploration' 1 23 12 1
 plotchars '160a zoneheight 8' 7 47 14 1
 if w > 8 && joy0fire then w = 0 : goto _screen2_setup
 w = w + 1
 drawscreen
 goto _title
 

 

 rem draw sprites with arrow with bg
_screen2_setup
 clearscreen 
 gosub drawZoneBG
 m = 0  
 n = 0
 c = 0
_screen2
 restorescreen
 y = 0
 x = 0
 c = 0 
 for i = 0 to n
   for j = 0 to m
    plotsprite  g8x8_4color c x y 0 
    x = x + 8
  next 
  x = 0
  y = y + 8     
  c = c + 1
  if c > 6 then c = 0
 next
 if w > 8 && joy0right then w =0 : m = m + 1
 if w > 8 && joy0down then w = 0 : n = n + 1
 if w > 8 && joy0left then w =0 :  m = m - 1
 if w > 8 && joy0up then w = 0 :  n = n - 1
 if w > 8 && joy0fire then w = 0 : goto _screen3_setup
 w = w + 1
 if n > 24 then n = 0
 if m > 20 then m = 0
  rem plotchars 'joystick to draw fire to next' 7 10 23 1
  r = n + 1
  s = m + 1
  plotvalue font 7 s 2 25 23 doublewide
  plotvalue font 7 r 2 35 23 doublewide
  plotvalue font 7 z 2 45 23 doublewide
 drawscreen
 z = 0
 goto _screen2 

 rem draw sprites with arrow no bg
_screen3_setup
 m = 0  
 n = 0
 c = 0
_screen3
 clearscreen
 y = 0
 x = 0 
 c = 0
 for i = 0 to n
   for j = 0 to m
    plotsprite  g8x8_4color c x y 0 
    x = x + 8
  next 
  x = 0
  y = y + 8 
  c = c + 1    
  if c > 6 then c = 0
 next
 if w > 8 && joy0right then w =0 : m = m + 1
 if w > 8 && joy0down then w = 0 : n = n + 1
 if w > 8 && joy0left then w =0 :  m = m - 1
 if w > 8 && joy0up then w = 0 :  n = n - 1
 if w > 8 && joy0fire then w = 0 : goto _screen4_setup
 w = w + 1
 if n > 24 then n = 0
 if m > 20 then m = 0
 r = n + 1
  s = m + 1
  plotvalue font 7 s 2 25 23 doublewide
  plotvalue font 7 r 2 35 23 doublewide
  plotvalue font 7 z 2 45 23 doublewide
 drawscreen
 z = 0
 goto _screen3

 rem draw sprites with arrow no bg animated

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
 if w > 8 && joy0right then w =0 : m = m + 1
 if w > 8 && joy0down then w = 0 : n = n + 1
 if w > 8 && joy0left then w =0 :  m = m - 1
 if w > 8 && joy0up then w = 0 :  n = n - 1
 if w > 8 && joy0fire then w = 0 : goto _screen4
 w = w + 1
 f = f + 1
 if f > 3 then f = 0
 if n > 24 then n = 0
 if m > 20 then m = 0
 r = n + 1
  s = m + 1
  plotvalue font 7 s 2 25 23 doublewide
  plotvalue font 7 r 2 35 23 doublewide
  plotvalue font 7 z 2 45 23 doublewide
 drawscreen
 z = 0
 goto _screen4
 
drawZoneBG
 x = 0
 y = 0
 for j = 0 to 12
  for i = 0 to 1
   plotsprite  zonebg80x16_8 7 x y 0
   x = x + 80
  next
  x = 0
  y = y + 16
 next  
 savescreen
 return

topscreenroutine
 z = z + 1 
 return