 set zoneheight 16
 displaymode 160A
 set plotvalueonscreen on
 set romsize 128kRAM
 set dlmemory $4000 $7FFF
 set pokeysupport on
 BACKGRND=$00
 incgraphic font.png 160A 0 2 3 1
 
 characterset font
 alphachars '0123456789abcdefghijklmnopqrstuvwxyz>`?!/.,-_()[]&AB '
  set plotvalueonscreen on 

  rem red pallette
  P0C1=$44
  P0C2=$32
  P0C3=$F1
  rem grey pallette
  P1C1=$0A
  P1C2=$05
  P1C3=$0F
  rem brown pallette
  P2C1=$F5
  P2C2=$3F
  P2C3=$3C
  rem green pallette
  P3C1 =$B2
  P3C2 =$C8
  P3C3 =$CB
  rem blue - palleete
  P4C1 =$70
  P4C2 =$74
  P4C3 =$99
  rem orange pallette
  P5C1 = $35
  P5C2 = $39
  P5C3 = $3C
  rem purple palette
  P6C1 = $50
  P6C2 = $54
  P6C3 = $58
  rem yellow pallette
  P7C1 = $18
  P7C2 = $1B
  P7C3 = $1F

  dim f1 = var1
  dim f2 = var2
  dim f3 = var3
  dim f4 = var4
  dim w1 = var5
  dim w2 = var6
  dim w3 = var7
  dim w4 = var8
  dim v1 = var9
  dim v2 = var10
  dim v3 = var11
  dim v4 = var12

  dim f1s = var13
  dim f2s = var14
  dim f3s = var15
  dim f4s = var16
  dim w1s = var17
  dim w2s = var18
  dim w3s = var19
  dim w4s = var20
  dim v1s = var21
  dim v2s = var22
  dim v3s = var23
  dim v4s = var24

  dim tColor = var25
  dim fireWait = var26
  dim fireWaitMax = var27   

  f1 = 0
  f2 = 0
  f3 = 0
  f4 = 0
  w1 = 10
  w2 = 0
  w3 = 0
  w4 = 0
  v1 = 10
  v2 = 0
  v3 = 0
  v4 = 0

  f1s = 1
  f2s = 0
  f3s = 0
  f4s = 0
  w1s = 0
  w2s = 0
  w3s = 0
  w4s = 0
  v1s = 0
  v2s = 0
  v3s = 0
  v4s = 0
  tColor = 0
  fireWait=0
  fireWaitMax=8

mainScreen
    clearscreen

         psound 0,f1,w1,v1
         psound 1,f2,w2,v2
         psound 2,f3,w3,v3
         psound 3,f4,w4,v4

    plotchars 'freq   wave  vol' 5 55 2 
    plotchars 'channel 0' 1 10 3 
    plotchars 'channel 1' 1 10 4
    plotchars 'channel 2' 1 10 5
    plotchars 'channel 3' 1 10 6

    if f1s then tColor = 3
    if !f1s then tColor = 4
    plotvalue font tColor f1 2 60 3
    plotvalue font 4 f2 2 60 4
    plotvalue font 4 f3 2 60 5
    plotvalue font 4 f4 2 60 6

    if w1s then tColor = 3
    if !w1s then tColor = 4
    plotvalue font tColor w1 2 85 3
    plotvalue font 4 w2 2 85 4
    plotvalue font 4 w3 2 85 5
    plotvalue font 4 w4 2 85 6

    if v1s then tColor = 3
    if !v1s then tColor = 4
    plotvalue font tColor v1 2 110 3
    plotvalue font 4 v2 2 110 4
    plotvalue font 4 v3 2 110 5
    plotvalue font 4 v4 2 110 6

    if fireWait < fireWaitMax then goto _skipInput
    fireWait = 0
    if joy0fire1 && f1s then  f1 = f1 + 1
    if joy0fire0 && f1s then  f1 = f1 - 1
    if joy0fire1 && w1s then  w1 = w1 + 1
    if joy0fire0 && w1s then  w1 = w1 - 1
    if joy0fire1 && v1s then  v1 = v1 + 1
    if joy0fire0 && v1s then  v1 = v1 - 1
    if v1 > 15 then v1 = 0
    if w1 > 15 then w1 = 0
    if joy0left && f1s then f1s = 0 : v1s = 1 : goto _skipInput
    if joy0right && f1s then f1s =0 : w1s = 1 : goto _skipInput
    if joy0left && w1s then w1s = 0 :f1s = 1 : goto _skipInput
    if joy0right && w1s then w1s =0 :v1s = 1 : goto _skipInput
    if joy0left && v1s then v1s = 0 :w1s = 1 : goto _skipInput
    if joy0right && v1s then v1s =0 :f1s = 1 : goto _skipInput
_skipInput
    fireWait = fireWait + 1
    if fireWait >= fireWaitMax then fireWait = fireWaitMax + 1

    drawscreen


  goto mainScreen