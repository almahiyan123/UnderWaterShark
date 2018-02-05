rem Under Water Shark Game
 rem Alabdullah Mahiyan, Jhillika Kumar, Michelle Zheng
 rem LMC 2700 Project 6 
 
 rem In this game the player is a shark represented as teeth. They can eat the yellow fish by pressing the space bar. They must 
 rem avoid touching black fish or they will lose a life. Black fish will veer toward you in order to touch you as they come 
 rem through the screen. 
 rem AFTER catching every 20 fish, the game will become increasingly faster. 
 
 set kernel_options pfcolors no_blank_lines
 set romsize 4k
 const pfscore=1
 
program_beginning
 pfcolors:
 $AE
 $AC
 $AA
 $A8
 $A6
 $A4
 $A2
 $A0
 $2A
 $28
 $24
end
 
 playfield:
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 XXXXXXXXXX............XXXXXXXXXX
 XXXXXXXXXX............XXXXXXXXXX
 XXXXXXXXXX............XXXXXXXXXX
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
end
 
AtariLogo
 player0:
 %00100001
 %01010010
 %10001010
 %10001010
 %10001001
 %00000000
 %11100001
 %00010001
 %00001001
 %00001001
 %00000101
 %00000101
 %00000101
 %00000101
 %00000101
 %00000101
end
 
 player1:
 %11000110
 %00000001
 %00000110
 %00001000
 %11000110
 %00000000
 %00001110
 %00010000
 %00100000
 %00100000
 %01000000
 %01000000
 %01000000
 %01000000
 %01000000
 %01000000
end
 COLUBK = $00
 a = 0
 b = 0
 d = 0
 h = 0
 i = 1
 j = 240
 k = 0
 l = 0
 m = 8
 n = 0
 o = 0
 
draw_loop
 if switchreset then goto program_beginning
 if d = 1 then gosub change_the_sprites1
 if d = 3 then gosub change_the_sprites2
 if a = 0 then gosub logos
 if a = 1 then gosub title_holder
 if a = 2 then gosub p1ready
 if a = 3 then gosub SetupGame
 if a = 4 then gosub playgame
 if a = 4 then gosub music_player
 if a = 4 then if c = 4 then gosub ani0
 if a = 4 then if c = 4 then AUDV0 = 0
 if a = 4 then if c = 4 then AUDC0 = 0
 if a = 4 then if c = 4 then AUDF0 = 0
 if a = 4 then if c = 4 then AUDV1 = 0
 if a = 4 then if c = 4 then AUDC1 = 0
 if a = 4 then if c = 4 then AUDF1 = 0
 if a = 4 then if c = 4 then c = 0
 if a = 4 then if c = 3 then gosub ani1
 if a = 4 then if c = 2 then gosub ani2
 if a = 4 then if c = 1 then gosub ani1
 if a = 4 then if c = 0 then gosub ani0
 if a = 4 then if n = 0 then gosub fish_ani0
 if a = 4 then if n = 1 then gosub fish_ani1
 drawscreen
 goto draw_loop
 
logos
 if b < 12 then c = b
 if d then skip
 if b = 12 then AUDV0 = 4 : AUDC0 = 4 : AUDV1 = 4 : AUDF0 = 7 : AUDC1 = 2 : AUDF1 = 5
 if b = 14 then AUDV0 = 0 : AUDC0 = 0 : AUDV1 = 0 : AUDF0 = 0 : AUDC1 = 0 : AUDF1 = 0
 
skip
 if b = 87 then if d = 4 then c = 0
 if b = 87 then if d = 4 then a = 1
 if b = 87 then if d = 4 then return
 if b = 87 then c = 11
 if b = 88 then c = 10
 if b = 89 then c = 9
 if b = 90 then c = 8
 if b = 91 then c = 7 
 if b = 92 then c = 6 
 if b = 93 then c = 5
 if b = 94 then c = 4 
 if b = 95 then c = 3 
 if b = 96 then c = 2 
 if b = 97 then c = 1 
 if b = 98 then c = 0
 if b = 99 then d = d + 1
 if b = 99 then c = 0
 if b = 99 then b = 0
 player0x = 76
 player0y = 37
 player1x = 83
 player1y = 37
 COLUP0 = c
 COLUP1 = c
 scorecolor = $00
 b = b + 1
 return
change_the_sprites1
 player0:
 %00000000
 %00000000
end
 
 player1:
 %00000000
 %00000000
end
 
 d = 2
 return
 
change_the_sprites2
 player0:
 %10001000
 %10001000
 %10001110
 %11100000
 %10100000
 %11100000
 %00000000
 %11111011
 %10101010
 %10101011
 %10101000
 %00000000
 %11101010
 %10101010
 %10101110
 %10100000
end
 
 player1:
 %01100111
 %10000101
 %11100111
 %10010001
 %01100001
 %00000000
 %00000000
 %10100100
 %10100100
 %01110111
 %00100000
 %00000000
 %11101000
 %10101000
 %11101110
 %00100000
end
 
 d = 4
 return
title_holder
 c = c - 1
 AUDV0 = 8
 AUDC0 = 1
 AUDF0 = c
 AUDV1 = 7
 AUDC1 = 8
 AUDF1 = c
 player0x = 76
 player0y = 37
 player1x = 83
 player1y = 37
 COLUP0 = c
 COLUP1 = c
 if joy0fire then a = 2
 if joy0fire then c = 0
 return
 
p1ready
 player0:
 %00000000
 %00011110
 %00100010
 %00101110
 %00100000
 %00100000
 %00100000
 %00011110
 %00000000
 %00100000
 %00100000
 %00100000
 %00111110
 %00100010
 %00100010
 %00111110
end
 
 player1:
 %00000000
 %00111001
 %01000100
 %01000101
 %01000101
 %00111001
 %00000001
 %00000001
 %00000000
 %00011100
 %00001000
 %00001000
 %00001000
 %00001000
 %00011000
 %00001000
end
 
 player0x = 76
 player0y = 37
 player1x = 83
 player1y = 37
 COLUP0 = $0A
 COLUP1 = $0A
 AUDV0 = 0
 AUDV1 = 0
 AUDC0 = 0
 AUDC1 = 0
 AUDF0 = 0
 AUDF1 = 0
 c = c + 1
 if c = 99 then a = 3
 return
SetupGame
 pfcolors:
 $AE
 $AC
 $AA
 $A8
 $A6
 $A4
 $A2
 $A0
 $2A
 $28
 $24
end
 playfield:
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 ..X..X.X..XX..XX.XXXX.X.X..X.XX.
 X.X.XX.X..XX.XXX.XX.X.X.XX.X..X.
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
end
 COLUP0 = $1E
 player0:
 %01111111
 %11010101
 %10010101
 %10000000
 %10000000
 %10101010
 %11101010
 %01111111
end
 COLUP1 = $FC
 COLUBK = $C6
 c = 0
 a = 4
 f = 0
 player1x = 137
 player0y = 40
 player0x = 50
 score = 0
 z = 3
 pfscore1 = %00010101
 pfscore2 = %11111111
 pfscorecolor = $CE
 return
 
playgame
 COLUP0 = $1E
 missile0height = 8
 if g = 0 then COLUP1 = $FC
 if g = 1 then COLUP1 = $00
 if joy0up then player0y = player0y - 1
 if joy0up then if player0y < 8 then player0y = 8
 if joy0down then player0y = player0y + 1
 if joy0down then if player0y > 65 then player0y = 65
 if joy0left then player0x = player0x - 1
 if joy0left then if player0x < 17 then player0x = 17
 if joy0left then e = 8
 if joy0right then player0x = player0x + 1
 if joy0right then if player0x > 138 then player0x = 138
 if joy0right then e = 0
 REFP0 = e
 if joy0fire then if c = 0 then c = 1
 if c = 1 then AUDV0 = 8
 if c = 1 then AUDC0 = 2
 if c = 1 then AUDF0 = 12
 if c = 1 then AUDV1 = 8
 if c = 1 then AUDC1 = 6
 if c = 1 then AUDF1 = 3
 player1x = player1x - i
 if !collision(player1,playfield) then f = 1
 if c > 0 then if collision(player0,player1) then if g = 0 then score = score + 1
 if c > 0 then if collision(player0,player1) then if g = 0 then pfscore2 = pfscore2 * 2|1
 if c > 0 then if collision(player0,player1) then if g = 0 then h = h + 1
 if c > 0 then if collision(player0,player1) then f = 1
 if h = 20 then i = i + 1
 if h = 20 then if j > 1 then j = j - 1
 if h = 20 then if m > 1 then m = m - 1
 if h = 20 then h = 0
 if collision(player0,player1) then if g = 1 then z = z - 1
 if collision(player0,player1) then if g = 1 then pfscore1 = pfscore1/4
 if collision(player0,player1) then if g = 1 then k = 0
 if collision(player0,player1) then if g = 1 then pfscore2 = %11111111
 if collision(player0,player1) then if g = 1 then f = 1
 if f = 1 then player1x = 137
 if f = 1 then player1y = (rand&31) + 10
 if f = 1 then g = (rand/128)
 if f = 1 then l = 0
 if f = 1 then if i > 2 then p = (rand&7)
 f = 0
 k = k + 1
 if k = j then pfscore2 = pfscore2/2
 if k = j then k = 0
 if pfscore2 = 0 then z = z - 1
 if pfscore2 = 0 then pfscore1 = pfscore1/4
 if pfscore2 = 0 then pfscore2 = %11111111
 l = l + 1
 if g = 1 then if l = m then if player1y < player0y then player1y = player1y + 1
 if g = 1 then if l = m then if player1y > player0y then player1y = player1y - 1
 if l = m then l = 0
 o = o + 1
 if o = 10 then n = n + 1
 if o = 10 then o = 0
 if n = 2 then n = 0
 if z = 0 then goto program_beginning
 return
 
ani0
 player0color:
 $30
 $32
 $34
 $36
 $36
 $34
 $32
 $30
end
 player0:
 %01111111
 %11010101
 %10010101
 %10000000
 %10000000
 %10101010
 %11101010
 %01111111
end
 return
 
ani1
 player0:
 %00000000
 %01111111
 %10010101
 %10010101
 %10101010
 %10101010
 %01111111
 %00000000
end
 c = c + 1 
 return
 
ani2
 player0:
 %00000000
 %00000000
 %01111111
 %10111111
 %10111111
 %01111111
 %00000000
 %00000000
end
 c = c + 1
 return
 
fish_ani0
 player1:
 %00000000
 %00110001
 %01111011
 %11111111
 %11011111
 %01111011
 %00110000
 %00000000
end
 return
 
fish_ani1
 player1:
 %00000000
 %00110000
 %01111011
 %11111111
 %11011111
 %01111011
 %00110001
 %00000000
end
 return
 
music_player
 if q > 0 then r = r + 1
 if q = 0 then AUDC0 = 0 : AUDC1 = 0 : AUDV0 = 0 : AUDV1 = 0 : AUDF0 = 0 : AUDF1 = 0
 if q = 1 then AUDV0 = 8 : AUDC0 = 6 : AUDF0 = 3
 if q = 2 then AUDV1 = 8 : AUDC1 = 1 : AUDF1 = 12
 if q = 3 then AUDV1 = 8 : AUDC1 = 1 : AUDF1 = 2
 if q = 4  then AUDV1 = 8 : AUDC1 = 12 : AUDF1 = 23 + m
 if r = 3 then q = 0 : r = 0
 return