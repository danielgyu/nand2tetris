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

// https://github.com/havivha/Nand2Tetris/blob/master/04/mult/Mult.asm
    @2
    M=0     // R2 = 0
    @i
    M=0     // i=0
(LOOP)
    @i
    D=M     // D=i
    @0
    D=D-M   // D=i-R0
    @END
    D;JGE    // if i-R0 >= 0 goto END

    @1
    D=M     // D=R1
    @2
    M=D+M   // R2=R2+R1
    @i
    M=M+1   // i=i+1
    @LOOP
    0;JMP   // Repeat
(END)
    @END
    0;JMP
