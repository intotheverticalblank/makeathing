Lionpoulos  #6  #6                                                             " 
� *** STOS: The Game Creator   
 � ***  0 � *** Visual Studio Code Lanugage Extension  $ (� *** Written by Neil Halliday   
 2� ***  
 <� ***  * F� *** grief3.stos : main program file   P:   Z:   d��(�   )��    default  : n��(�   )��    fload��(�    ")��    *.asc��(�    ")   x:   �� *** Error Handling ***    ���    �      & �� �   MESSAGES$��    
Messages:     �:  " �� *** start STOS Program ***   \ �� ******************** version 1 - use stos sprites in 9 columns *********************    ����   Ƞަ:�ͦ:��:��         �:  2 ܠ����    
:�  needed for screen copy versions   �:   ���    	GRSPR.mbk,�       : ��    XP�(�(�    )��(�    )��(�    ),�    PALT)  `�    XP��   XP��   :�    �    I��     ��   :��    I,�(�    I��    ��   XP):��   I  :  � goto 2220  ":  ",�     �    SCTR��    ��      26��   SCTR��   ,�   SCTR��   ,�    ,�      @�  J:  "T�     �    SCTR��   ��   	   ,^���    SCTR,�   (1,1,132)(1,-1,132)L   h�  r:  |���  �:  0��    FCTR��    :� number of frames counted  ����        ��    FPS��        &��    SE��    :� seconds elapsed   ��        �:  
̊ FPS  &ֵ�   FCTR:� inc the fram counter  �:  L� if 4 second has elapsed then let se be the number of seconds elapsed   r�����   Ț     �    SE����   2:�   FPS��    FCTR��   SE:� fps=number of frames / number of seconds = fps.   �:  6��   ,�   :��    9 tall STOS sprites in a row   2��   ,�   :��    using the move on command  *��   ,�   :��    fps: ;�    FPS;   .&��   ,�   :��    
frame ctr ;�   FCTR   "0��   ,�   :��    timer ;�   &:��   ,�   :��    ctr ;�   CTR  D��   CTR  N:  X��   CTR��       0b���:��   :��    ,�   :��    press a key  l�w   v:  :�� ******************** version 2 ********************  ,�� sprites with update off and wait vBL   ��  ����  ���   "��     �    SCTR��    ��      2���   SCTR��   ,�   SCTR��   ,�    ,�      Ƃ  �:  "ڝ     �    SCTR��   ��   	   ,䠴�    SCTR,�   (1,1,132)(1,-1,132)L   �  ����  �    CTR��        0�    FCTR��    :� number of frames counted  ���         �    FPS��        &*�    SE��    :� seconds elapsed   4�        >:  
H� FPS  &R��   FCTR:� inc the fram counter  \:  Lf� if 4 second has elapsed then let se be the number of seconds elapsed   rp����   Ț     �    SE����   2:�   FPS��    FCTR��   SE:� fps=number of frames / number of seconds = fps.   z:  6���   ,�   :��    9 tall STOS sprites in a row   :���   ,�   :��     using the move but update in VBL   *���   ,�   :��    fps: ;�    FPS;   .���   ,�   :��    
frame ctr ;�   FCTR   "���   ,�   :��    timer ;�   ���   CTR  ��  ʠ�   Ԅ�   FCTR��   d   ޠ��  0���:��   :��    ,�   :��    press a key  �w   :�� ******************** version 3 ********************  *�  sprites moved with dx and wait vBL  �  ��   "$�     �    SCTR��    ��      2.��   SCTR��   ,�   SCTR��   ,�    ,�      8�  B:  >L�    SPRX��    :� the x location of te left most sprite   V�    DX��      0`�    FCTR��    :� number of frames counted  j���        t�    FPS��        &~�    SE��    :� seconds elapsed   ��        �:  
�� FPS  &���   FCTR:� inc the fram counter  �:  L�� if 4 second has elapsed then let se be the number of seconds elapsed   rĢ���   Ț     �    SE����   2:�   FPS��    FCTR��   SE:� fps=number of frames / number of seconds = fps.   �:  "؝     �    SCTR��    ��      @��   SCTR��   ,(�    SCTR��   )��    SPRX,�    ,�      �  �:  " �    SPRX��   SPRX��   DX   ,
��   SPRX��   ��     �    DX���       *��   SPRX��    �     �    DX��      :  6(��   ,�   :��    9 tall STOS sprites in a row   42��   ,�   :��    using dx but update in VBL   *<��   ,�   :��    fps: ;�    FPS;   .F��   ,�   :��    
frame ctr ;�   FCTR   "P��   ,�   :��    timer ;�   &Z��   ,�   :��    ctr ;�   CTR  d��   CTR  n�  x��   ���   CTR��    �   0����:��   :��    ,�   :��    press a key  ��w   �:  �� @version4  :�� ******************** version 4 ********************  �� 16px offset movement   2Ȋ 1. Copy 9 sprites to screen at 16px offset   Ҋ turn autoback off  ܊ do 16 px offset version  �:  &�� *** copy formation to screen 10  �� *** at 16px offset   :  "�     �    SCTR��    ��      2��   SCTR��   ,�   SCTR��   ,�    ,�      "�  ,:  6�w   2@��,�    ,�    ,�   �,�   ��   
,�   ,�        J��:� turns off all sprites   0T� do not need a separte sprite background.   ^� this adds speed  h��  r�    XOFF��       |�    CTR��        ��    DX��      ��    X1��       ��    Y1��       ��    X2��  @   ��    Y2��      \��    XEND��   �:� 320 - (144+16)  The screem width minus the formation length + offset  L�   
,�   ��   XOFF,�   Y1,�   ���   XOFF,�   Y2��,�   X1,�       ̷  ֠w   �:  �  ����  �:  0�    FCTR��    :� number of frames counted  ���        �    FPS��        &&�    SE��    :� seconds elapsed   0:  :�        D:  8N� the x1 and x2 in cls have to be 0 or 16 multiples  *X�    X1C�((�    X1��   DX)��    )   b�    X2C��    X1C��    �   .l��,�    ,�   X1C,�     ��   X2C,�       v�    XOFF��   X1��      J���   
,�   ��   XOFF,�   Y1,�   X1��   �,�   Y2��,�   X1,�       ��    X1��   X1��   DX   (���   X1��    �     �    DX��      .���   X1��   XEND�     �    DX���       �:  
�� FPS  &���   FCTR:� inc the fram counter  �:  LЊ if 4 second has elapsed then let se be the number of seconds elapsed   rڢ���   Ț     �    SE����   2:�   FPS��    FCTR��   SE:� fps=number of frames / number of seconds = fps.   �:  ���:��      &���   ,�   :��    x1c ;�   X1C  4��   ,�   :��    x at multiples of 16 or 0,   4��   ,�   :��    we copy from 10 at pixel 16  6��   ,�   :��    for any other x we copy from   ( ��   ,�   :��    16 -(x mod 16)   &*��   ,�   :��    x1=;�    X1   &4��   ,�   :��    x2=;�    X2   ,>��   ,�   :��    	Move CTR ;�    CTR  LH��   ,�   :��    	fps:     :� not clearingwhole screen so clear first  &R��   ,�   :��    fps:;�   FPS  \:  f��   CTR  
p�:��   z��   CTR��    �   �:  $���   ,�   :��    press a key  ��w   �:  �� @version5  :�� ******************** version 5 ********************  <�� copy peiate 4 to an array of strimgs at 0,1,2,4,8,16   Pʊ 1. Copy 9 versions of it to the screen and use the one needed to display   Ԋ turn autoback off  ފ turn synco off   � do 16 px offset version  �:  &�� *** copy formation to screen 10  	� *** at 16px offset   	:  	� version   	$� array of formations at 16  	.:  	8� version  "	B� array of individual images   "	L� basically our own pre-roll   	V:  <	`���   FM$(�    ):� store the screen parts as an array   :	j��   ,�   :��     Creatiing pre-shifted spritesrun   	t:   	~�     �    X��     ��      	��   	���   ,�   X,�     ,�      	����    :��:��   4	�� �   FM$(�    X)��(�,�    ,�    ��    ,�    )  	���   ,�   :��         "	���   ,�   :��    x ;�   X  	Ă�   X  	�:  $	ة�   ,�   :��    Press a Key  	�w   	�:  0	�� do not need a separte sprite background.   
 � this adds speed  

��  
�  
���  
(:  
2�    XOFF��       
<�    CTR��        
F�    DX��      
P�    X1��       
Z�    Y1��       \
d�    XEND��   �:� 320 - (144+16)  The screem width minus the formation length + offset  
n:  0
x�    FCTR��    :� number of frames counted  
����        
��    FPS��        &
��    SE��    :� seconds elapsed   
�:  
��        
�:  8
�� the x1 and x2 in cls have to be 0 or 16 multiples  
��    X1C��        
��    X2C��   @   .
ܴ�,�    ,�   X1C,�     ��   X2C,�        
�:  "
�     �    CTR��     ��      (
��    X�(�   CTR��    )��    X1   :�    XOFF��   X��    :� which array value to show   .�(�,�    X,�     )�� �   FM$(�    XOFF)  ��   CTR  ":  ,:  6�    X1��   X1��   DX   (@��   X1��    �     �    DX��      .J��   X1��   XEND�     �    DX���       T:  
^� FPS  (h��   FCTR:� inc the frame counter   r:  L|� if 4 second has elapsed then let se be the number of seconds elapsed   r�����   Ț     �    SE����   2:�   FPS��    FCTR��   SE:� fps=number of frames / number of seconds = fps.   �:  ����:��      :���   ,�   :��    x1 (spr1te x position) ;�    X1   8���   ,�   :��    xoff (spr1te frame) ;�   XOFF   ,���   ,�   :��    	Move CTR ;�    CTR  L©�   ,�   :��    	fps:     :� not clearingwhole screen so clear first  &̩�   ,�   :��    fps:;�   FPS  �:  ��   CTR  
�:��   ��   CTR��    �   �:  $��   ,�   :��    press a key  �w   � @errortrap   &�  "0��   output: ;��   MESSAGES$  :��   error number;��  D��   line number;��    