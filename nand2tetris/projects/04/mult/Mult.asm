// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

// e.g. 6 * 4
// s = 6, n = 4, i = 0
// if i < n
// then LOOP s + s TO R2
// else END

@0
D=A
@i
M=D

@R1
D=M
@n
M=D

// if i < n goto END
(LOOP)
@i
D=M
@n
D=D-M
@END
D;JEQ

// else add inplace
@R0
D=M
@R2
M=D+M

// add i and LOOP
@i
M=M+1
@LOOP
0;JMP


(END)
@END
0;JMP
