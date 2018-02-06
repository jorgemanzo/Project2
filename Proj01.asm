TITLE Program assingment 3     (Proj03.asm)

; Author: Jorge Manzo
; Course / Project ID Project3                Date: 2/1/2018
; Description: More Loopdie-doo

INCLUDE Irvine32.inc

; (insert constant definitions here)

.data
;Random Comment
; (insert variable definitions here)
LIMIT		=		-1	;The upper limit of the input
MINIMUM		=		-100;The lower limit of the input
ARRAYLIMIT	=		10	;How many nums we can have in our array
greeting1	BYTE	"Hello my name is Jorge Manzo and this is Programming Assignment 3",0
greeting2	BYTE	"Nice to meet you! ",0
instruct1	BYTE	"Please provide me your name (10 Characters max):",0
instruct2	BYTE	"Okay here is how this is going to work. Enter negative numbers between -100 and -1. Once you enter a number > -1 I will discard that number and do some calculations.",0
instruct3	BYTE	"Okay, lets display the fibs!: ",0
instruct4	BYTE	"Enter your numbers now!",0
Goodbye1	BYTE	"Laters, ",0
space		BYTE	"     ",0
name1		BYTE	10	DUP(0);
num1		SDWORD	?	;Storing the users input
nums		SDWORD	100	DUP(0);Numbers inputted
count		DWORD	0	;Number of user input




.code
main PROC
; (insert executable instructions here)


;Introduction
;Greeting user
mov		edx,	OFFSET	greeting1
call	WriteString
call	CrLf

;User Instructions
;Asking for name
mov		edx,	OFFSET	instruct1
call	WriteString
call	CrLf

;getUserData
;Getting name
mov		edx,	OFFSET	name1
mov		ecx,	SIZEOF	name1
call	ReadString

;Greeting user
mov		edx,	OFFSET	greeting2
call	WriteString
mov		edx,	OFFSET	name1
call	WriteString
call	CrLf

;get num of fib terms
mov		edx,	OFFSET	instruct2
call	WriteString
call	CrLf

;Setting up of the nums array and its counter
xor		ecx,	ecx
mov		edi, OFFSET	nums	;Moving address location of Nums to edi??


;DO-WHILE LOOP
GETINPUT:

;Clarifying instruction statement
mov		edx,	OFFSET	instruct4
call	WriteString
call	CrLf

;Reading user input
call	ReadInt
mov		num1,	eax


;Checking input
mov		edx,	num1
CMP		edx,	MINIMUM
JL		CALC		;If user input is below the minimum (-100)
CMP		edx,	LIMIT
JG		CALC		;If user input is above the limit (-1)

;Store input
mov		eax,	num1
mov		[edi	+	ecx	*	2],	eax	;Essentially doing append[i](num1)
INC		ecx
INC		count

;Check to see if count is still less than ARRAYLIMIT. If not, we cant take anymore nums
mov		eax,	count
CMP		eax,	ARRAYLIMIT
JGE		CALC

JMP		GETINPUT


CALC:

	exit	; exit to operating system
main ENDP

; (insert additional procedures here)

END main
