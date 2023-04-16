#Group: AHHHH (Khushi Gupta, Remi Ong, Tam Dinh, Viet Nguyen)
#Date: 4/13/2023
#Objective: Program 2 - Practice with Conditionals and Loops - Task 1
#-Write an Assembly program that will return a letter grade given a Decimal int from the user. Include the following:
#-a user menu
#-a main label, a looping label, and an exit label
#-a way for the user to continue getting letter grades or choose to exit
#-invalid input handling 

#Github link: https://github.com/AHHHHHsembly-Group-2640/Program-2/blob/0f88be4a56721fc1eb0a4e7f2ce1be21ef0d666e/Program2.asm2

.macro dashLine
    	li $v0, 4	
    	la $a0, dash
    	syscall
.end_macro 

.data
mainMenu: .asciiz "\n\n~~~~~~~~~~~~~~ Main Menu ~~~~~~~~~~~~~~\n(1) Get Letter Grade\n(2) Exit Program\nEnter '1' or '2' for your selection: "
enterScore: .asciiz "\nPlease answer a score as an integer value: "
dash: .asciiz "\n------------------------------------------\n"
letterA: .asciiz "The Grade is: A"
letterB: .asciiz "The Grade is: B"
letterC: .asciiz "The Grade is: C"
letterD: .asciiz "The Grade is: D"
letterF: .asciiz "The Grade is: F"
newScore: .asciiz "\nWould you like to enter a new score?\n(Y)Yes (N)No \n\nEnter 'Y' or 'N' for your selection: "
errorOutput: .asciiz "\nInvalid input! Please try again:"
exitOutput: .asciiz "\nProgram will now exit."
.text
main: 
	#Display main menu
	li $v0, 4	
    	la $a0, mainMenu
    	syscall
    	
    	#Get user's option
    	li $v0, 5
    	syscall
    	
    	move $s0, $v0
    	
    	dashLine
    	
    	#Continue if user chooses to continue
    	beq $s0, 1, continue
    	
    	#End program if user chooses to end
    	beq $s0, 2, end
    	
    	#Re-prompt the user if input is error
    	bne $s0, 1, optionHandling
    	bne $s0, 2, optionHandling
    	
optionHandling:
	li $v0, 4	
    	la $a0, errorOutput
    	syscall
    	j main
    	
continue:
	#Display Ask user to enter the score
    	li $v0, 4	
    	la $a0, enterScore
    	syscall
    	
    	#Get user's score
    	li $v0, 5
    	syscall 
    	
    	move $s0, $v0 #move to register $s0
    
    	
    	#Re-prompt the user if error input (Less than 0)
    	blt $s0, 0, integerHandling
    	
    	#Re-prompt the user if error input (Less than 0)
    	bgt $s0, 100, integerHandling
    	
    	#A if greater than or equal to 90
    	bge $s0, 90, gradeA
    	
    	#Else B if score is greater or euqal to 80 
    	bge $s0, 80, gradeB
    	
    	#Else C if score is greater or euqal to 70
    	bge $s0, 70, gradeC
    	
    	#Else D if score is greater or euqal to 60
    	bge $s0, 60, gradeD
    	
    	#Else F if score is less or equal to 59
    	ble $s0, 59, gradeF
	
gradeA:
	li $v0, 4
	la $a0, letterA
	syscall   
	
	dashLine
		
    	j loop
    	
gradeB:
	li $v0, 4
	la $a0, letterB
	syscall
	
	dashLine
	
	j loop
	
gradeC:
	li $v0, 4
	la $a0, letterC
	syscall
	
	dashLine
	
	j loop

gradeD:
	li $v0, 4
	la $a0, letterD
	syscall
	
	dashLine
	
	j loop
    	
gradeF:
	li $v0, 4
	la $a0, letterF
	syscall
	
	dashLine
	
	j loop
	
integerHandling:
	li $v0, 4	
    	la $a0, errorOutput
    	syscall
    	j continue

#loop to ask a new score if user decide to continue	
loop:
	li $v0, 4
	la $a0, newScore
	syscall
	
	#Get user input's character
	li $v0, 12
	syscall
	
	move $t0, $v0 #move to register $t0
	
	#load immediate 'y' to $t1 and 'n' to $t2 for comparation
	li $t1, 'y'
	li $t2, 'n'
	
	#if $t1 is equal to $t0 as 'y', continue the program
	beq $t1, $t0, continue
	
	#if $t2 is equal to $t0 as 'n', back to main menu
	beq $t2, $t0, main
	
	#Re-prompt if input is error
	li $v0, 4	
    	la $a0, errorOutput
    	syscall
    	
	j loop

# exit	
end:
	li $v0, 4	
    	la $a0, exitOutput
    	syscall
    	 
    	li $v0, 10     
   	syscall
    	
