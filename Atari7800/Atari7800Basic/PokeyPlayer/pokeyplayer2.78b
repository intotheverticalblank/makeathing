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

/*
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
*/
  dim tChannel = var1
  dim tFrequency = var2
  dim tWaveForm = var3
  dim tVolume = var4
  dim tType = var5
  dim tDuration = var6
  dim tColor = var7
  dim tSelected = var8
  dim tempX = var9
  dim tempY = var10
  dim tColumn = var11
  dim xChannel = var12
  dim xColumn = var13
  dim xDuration = var14
  dim xSilence = var15
  dim timeCount = var16
  dim xMode = var17
  dim tSilence = var18
  dim tTicks = var19
  dim tMode = var20
  ;dim tOriginalVolume = var20
  ;dim tVolumeChange

  const MODE_PLAY = 1
  const MODE_SILENCE = 2
  const TYPE_CONSTANT = 1
  const TYPE_ATTACK = 2
  const TYPE_DECAY = 3

 
  dim fireWait = var26
  dim fireWaitMax = var27   

  dim cChannel = $2200 ;; 4
  dim cFrequency = $2204 ; 4
  dim cWaveForm = $2208 ; 4
  dim cVolume = $220C ; 4
  dim cDuration = $2210 ; 4 
  dim cSilence = $2214 ; 4
  dim cType = $2218 ; 4
  dim cMode = $221C ; 4
  dim cTicks = $2220 ;4
  ;dim cOriginalVolume = $2224 ;4
  ;dim cVolumeChange = $2228



  
/*
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
  */
  tColor = 0
  fireWait=0
  fireWaitMax=3
  tChannel= 0
  tColumn = 0
  ;xDuration = 16
  ;xSilence = 8
  ;timeCount = 0
  xMode = MODE_PLAY
    ; init data
  for i = 0 to 3    
        cChannel[i] = i 
        cFrequency[i] = 0
        cWaveForm[i] = 0
        cVolume[i] = 0
        cDuration[i] = 8
        cSilence[i]  = 4
        cType[i]  = TYPE_CONSTANT
        cTicks[i]  = 0
        cMode[i]  = MODE_PLAY
        ;cOriginalVolume[i] = 0
        ;cVolumeChange[i] = 0
        
 next      
 tSelected = 0
mainScreen
    clearscreen
    for i = 0 to 3    
        tChannel = cChannel[i] 
        tFrequency = cFrequency[i]
        tMode = cMode[i]
        tType = cType[i]
        tDuration = cDuration[i]
        tSilence = cSilence[i]
        tTicks = cTicks[i]
        if tMode = MODE_SILENCE then tFrequency = 0
        tWaveForm = cWaveForm[i]
        if tMode = MODE_SILENCE then tWaveForm = 0
        tVolume = cVolume[i]
        if tMode = MODE_SILENCE then tVolume = 0
        if tType = TYPE_ATTACK then tVolume = tVolume + 1
        if tType = TYPE_DECAY then tVolume = tVolume - 1
        if tVolume = 16 then tVolume= 15
        if tVolume = 255 then tVolume = 0
       
        
        psound tChannel,tFrequency,tWaveForm,tVolume
        
        tTicks = tTicks + 1
        if tType = TYPE_ATTACK || tType = TYPE_DECAY then cVolume[i] = tVolume
        if tMode = MODE_PLAY && tTicks >= tDuration then goto _doEndPlay 
        goto _doSilentTest
_doEndPlay
        if tSilence > 0 then tMode = MODE_SILENCE  
        tTicks = 0 
        if tType = TYPE_ATTACK then tVolume = 0 :  cVolume[i] = tVolume  
        if tType = TYPE_DECAY then tVolume = 15 :  cVolume[i] = tVolume  
        goto _skipSilentTest
_doSilentTest
        if tSilence = 0 then goto _skipSilentTest
        if tMode = MODE_SILENCE && tTicks >= tSilence then goto _doEndSilence 
        goto _skipSilentTest
_doEndSilence        
        tMode = MODE_PLAY
        tTicks = 0
        if tType = TYPE_ATTACK then tVolume = 0 :  cVolume[i] = tVolume  
        if tType = TYPE_DECAY then tVolume = 15 :  cVolume[i] = tVolume   
_skipSilentTest
    cMode[i] = tMode
    cTicks[i] = tTicks 
    next    
    

    
    
    plotchars 'f' 5 20 2 
    plotchars 'w' 5 40 2 
    plotchars 'v' 5 60 2
    plotchars 'd' 5 80 2
    plotchars 's' 5 100 2
    plotchars 't' 5 120 2    

   
    plotchars 'c0' 1 10 3 
    plotchars 'c1' 1 10 4
    plotchars 'c2' 1 10 5
    plotchars 'c3' 1 10 6

    ;plotvalue font 2 tSelected 2 50 8
    ;plotvalue font 2 xColumn 2 50 9
    ;plotvalue font 2 xChannel 2 50 10

    plotchars 'reset to re-sync all channels' 1 10 7
    plotchars 'joystick to select' 1 10 8
    plotchars 'fire 1 to increase' 1 10 9
    plotchars 'fire 2 to decrease' 1 10 10

    tempX = 20
    tempY = 3
    for i = 0 to 3
        tFrequency = cFrequency[i]
        tWaveForm = cWaveForm[i]
        tVolume = cVolume[i]
        tDuration = cDuration[i]
        tSilence = cSilence[i]
        tType = cType[i]
        tColor = 4
        if tSelected = (i+0+i*6)-i then tColor = 5  
        plotvalue font tColor tFrequency 2 tempX tempY
        tempX = tempX + 20
        tColor = 4
        if tSelected = (i+1+i*6)-i then tColor = 5  
        plotvalue font tColor tWaveForm 2  tempX tempY
        tempX = tempX + 20
        tColor = 4
        if tSelected = (i+2+i*6)-i then tColor = 5  
        plotvalue font tColor tVolume   2  tempX tempY
        tempX = tempX + 20
          tColor = 4
        if tSelected = (i+3+i*6)-i then tColor = 5  
        plotvalue font tColor tDuration   2  tempX tempY
        tempX = tempX + 20 
          tColor = 4
        if tSelected = (i+4+i*6)-i then tColor = 5  
        plotvalue font tColor tSilence   2  tempX tempY
        tempX = tempX + 20
          tColor = 4
        if tSelected = (i+5+i*6)-i then tColor = 5  
        if tType = 1 then plotchars 'c' tColor tempX tempY 
        if tType = 2 then plotchars 'a' tColor tempX tempY 
        if tType = 3 then plotchars 'd' tColor tempX tempY 
        tempY = tempY + 1
        tempX = 20
    next

    if fireWait < fireWaitMax then goto _skipInput
    fireWait = 0
    xChannel = ((tSelected)/6)
    if xChannel > 3 then xChannel = 0
    if tSelected = (xChannel*6) + 0 then xColumn = 0
    if tSelected = (xChannel*6) + 1 then xColumn = 1
    if tSelected = (xChannel*6) + 2 then xColumn = 2
    if tSelected = (xChannel*6) + 3 then xColumn = 3
    if tSelected = (xChannel*6) + 4 then xColumn = 4
    if tSelected = (xChannel*6) + 5 then xColumn = 5
   
   
   ; slected indecies
   ;     FF   WW   VV
   ;Ch0   0   1    2
   ;Ch1   3   4    5
   ;Ch2   6   7    8
   ;Ch3   9  10   11

_testJoyFire0    
    if !joy0fire1 then goto _testJoyFire1
    if xColumn = 0 then tFrequency = cFrequency[xChannel] + 1 : cFrequency[xChannel] = tFrequency
    if xColumn = 1 then cWaveForm[xChannel] = cWaveForm[xChannel] + 1
    if xColumn = 2 then cVolume[xChannel] = cVolume[xChannel] + 1
    if xColumn = 3 then cDuration[xChannel] = cDuration[xChannel] + 1
    if xColumn = 4 then cSilence[xChannel] = cSilence[xChannel] + 1
    if xColumn = 5 then cType[xChannel] = cType[xChannel] + 1
    if cWaveForm[xChannel] > 15 then cWaveForm[xChannel] = 0
    if cVolume[xChannel] > 15 then cVolume[xChannel] = 0
    if cType[xChannel] > 3 || cType[xChannel] = 0 then cType[xChannel] = 1
    goto _skipInput
_testJoyFire1     
    if !joy0fire0 then goto _testJoyLeft 
    if xColumn = 0 then cFrequency[xChannel] = cFrequency[xChannel] - 1
    if xColumn = 1 then cWaveForm[xChannel] = cWaveForm[xChannel] - 1
    if xColumn = 2 then cVolume[xChannel] = cVolume[xChannel] - 1
    if xColumn = 3 then cDuration[xChannel] = cDuration[xChannel] - 1
    if xColumn = 4 then cSilence[xChannel] = cSilence[xChannel] - 1
    if xColumn = 5 then cType[xChannel] = cType[xChannel] - 1
    if cWaveForm[xChannel] > 15 then cWaveForm[xChannel] = 0
    if cVolume[xChannel] > 15 then cVolume[xChannel] = 0
    if cType[xChannel] > 3 || cType[xChannel] = 0 then cType[xChannel] = 1
    goto _skipInput
_testJoyLeft    
    if !joy0left then goto _testJoyRight
    tSelected = tSelected - 1
    if tSelected > 23 then tSelected = 0
    goto _skipInput 
_testJoyRight
    if !joy0right then goto _testJoyUp
     tSelected = tSelected + 1
    if tSelected > 23 then tSelected = 0
_testJoyUp
    if !joy0up then goto _testJoyDown    
    tSelected = tSelected - 6
    if tSelected > 23 then tSelected = tSelected + 6
_testJoyDown
    if !joy0down then goto _testReset
     tSelected = tSelected + 6
    if tSelected > 23 then tSelected = tSelected - 6       
_testReset
    if !switchreset then goto _skipInput
    for i = 0 to 3    
        cTicks[i]  = 0
        cMode[i]  = MODE_PLAY
        tType = cType[i]
        if tType = TYPE_ATTACK then tVolume = 0
        if tType = TYPE_DECAY then tVolume = 15
        cVolume[i] = tVolume 
        
    next      

_skipInput
    fireWait = fireWait + 1
    if fireWait >= fireWaitMax then fireWait = fireWaitMax + 1

    drawscreen


  goto mainScreen