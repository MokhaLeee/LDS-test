.section .data.oam
.global oam1
oam1:
    .4byte scr1
.global oam2
oam2:
    .4byte scr2

.section .data.script
.global scr1
scr1:
    .4byte oam1
.global scr2
scr2:
    .4byte oam2
