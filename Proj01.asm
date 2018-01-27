TITLE Program assingment 2     (Proj02.asm)

; Author: Jorge Manzo
; Course / Project ID Project2                Date: 1/22/2018
; Description: Loopdie-doo

INCLUDE Irvine32.inc

; (insert constant definitions here)

.data
;Random Comment
; (insert variable definitions here)
LIMIT		=		46	;The upper limit of the input
MINIMUM		=		1	;The lower limit of the input
FOUR		=		4	;Once fiver is no longer < FOUR, print a new line
greeting1	BYTE	"Hello my name is Jorge Manzo and this is Programming Assignment 2",0
greeting2	BYTE	"Nice to meet you! ",0
instruct1	BYTE	"Please provide me your name (10 Characters max):",0
instruct2	BYTE	"Okay, please provide me a number to calculate the numbers of the Fibonacci sequence up your stated term (Must be between 1 and 46) ",0
instruct3	BYTE	"Okay, lets display the fibs!: ",0
instruct4	BYTE	"Enter your number now. If you see this again, its because your input was out of range! ",0
Goodbye1	BYTE	"Laters, ",0
space		BYTE	"     ",0
name1		BYTE	10 DUP(0);
num1		DWORD	?	;The user's n for the number of terms they wany
n1			DWORD	0
n2			DWORD	1
n3			DWORD	?
fiver		DWORD	1	;Used to count the number of nums printed on a line. We start at 1 because we will always print at least one number no matter what.




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
JL		GETINPUT		;If num1 is < MINIMUM try again
CMP		edx,	LIMIT
JG		GETINPUT		;If num1 is > LIMIT try again

;displayFibs
;Initialize the loop
mov		eax,	num1
DEC		eax
mov		ecx,	eax


;If the user asks for 1 or 2 terms, print said terms

;Always print 1 at least
mov		eax,	1
Call	WriteDec		;Write a 1
mov		edx,	OFFSET	space
Call	WriteString		;Write 5 spaces

;Check to see if the user asked for just 1 term
mov		eax,	num1
CMP		eax,	1
JE		ENDING			;Jump to the end if they only asked 1

;Loop
FIBB:
mov		eax,	n1
ADD		eax,	n2		;Add n1 and n2
mov		n3,		eax		;Store result in n3

call	WriteDec		;Print the Fibb number
mov		edx,	n2		;move n2 to n1 so it can be used in future calculations
mov		n1,		edx
mov		edx,	n3		;Update n2 with n3 to be used in later calculations
mov		n2,		edx
mov		edx,	OFFSET space
call	WriteString

mov		eax,	fiver	;Lets check if we've printed less than 5 things so far
CMP		eax,	FOUR	
JL		INCREASE
JMP		NEW

INCREASE:
INC		eax
mov		fiver,	eax
JMP		SKIP

NEW:
mov		eax,	0
mov		fiver,	eax
Call	CrLf

SKIP:
loop	FIBB
ENDING:
Call	CrLf

;farewell
mov		edx,	OFFSET	Goodbye1
call	WriteString
mov		edx,	OFFSET	name1
call	WriteString
call	CrLf






	exit	; exit to operating system
main ENDP

; (insert additional procedures here)

END main
