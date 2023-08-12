 rem 8x8 alternating colors
_screen3x
 restorescreen
 y = 0
 x = 0 
 c = 0
 for j = 0 to 23
  for i = 0 to 9
   plotsprite  g8x8_4color c x y 0
   x = x + 16
  next
  y = y + 8
  x = 0
  c = c + 1
  if C > 1 then c = 0
 next 
 if w > 20 && joy0fire then w = 0 : goto _screen4x_setup
 w = w + 1
  plotchars '160a znht 8  8x8 lines 2 colors' 7 32 23 1
 drawscreen
 goto _screen3

 rem 8x16 alternating colors
_screen4x_setup
_screen4x
 restorescreen
 y = 0
 x = 0 
 c = 0
 for j = 0 to 15
  for i = 0 to 20
   plotsprite  g8x16_4color c x y 0
   x = x + 16
  next
  y = y + 16
  x = 0
  c = c + 1
  if C > 1 then c = 0
 next 
 if w > 20 && joy0fire then w = 0 : goto _screen5
 w = w + 1
 drawscreen
 goto _screen4



 rem 16x16 alternating colors

_screen5
 restorescreen
 y = 0
 x = 0 
 c = 0
 for j = 0 to 15
  for i = 0 to 10
   plotsprite  g16x16_4color c x y 0
   x = x + 16
  next
  y = y + 16
  x = 0
  c = c + 1
  if C > 1 then c = 0
 next 
 if w > 20 && joy0fire then w = 0 : goto _screen4
 w = w + 1
 drawscreen
 goto _screen5