#Group: AHHHH (Khushi Gupta, Remi Ong, Tam Dinh, Viet Nguyen)
#Date: 4/13/2023
#Objective: Program 2 - Practice with Conditionals and Loops
#Github link: https://github.com/AHHHHHsembly-Group-2640/Program-2

.data
mainMenu: .asciiz "~~~~~~~~~~~~~~ Main Menu ~~~~~~~~~~~~~~\n(1) Get Letter Grade\n(2) Exit Program\nEnter '1' or '2' for your selection\n"
enterScore: .asciiz "\nPlease answer a score as an integer value: "
letterA: .asciiz "The Grade is: A"
letterB: .asciiz "The Grade is: B"
letterC: .asciiz "The Grade is: C"
letterD: .asciiz "The Grade is: D"
letterF: .asciiz "The Grade is: F"
newScore: .asciiz "\nWould you like to enter a new score?\n(Y)Yes (N)No "

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
    	
    	#Continue if user chooses to continue
    	beq $s0, 1, continue
    	
    	#End program if user chooses to end
    	beq $s0, 2, end
    	
continue:
	#Display Ask user to enter the score
    	li $v0, 4	
    	la $a0, enterScore
    	syscall
    	
    	#Get user's score
    	li $v0, 5
    	syscall
    	
    	move $s0, $v0 #move to register $s0
    	
    	#A if greater than or equal to 90
    	bge $s0, 90, gradeA
    	
    	#Else B if score is greater or euqal to 80, move to another condition 
    	bge $s0, 80, gradeB
    	
    	#Else C if score is greater or euqal to 70, move to another condition 
    	bge $s0, 70, gradeC
    	
    	#Else D if score is greater or euqal to 60, move to another condition 
    	bge $s0, 60, gradeD
    	
    	#Else F if score is less or equal to 59, get grade F
    	ble $s0, 59, gradeF
	
gradeA:
	li $v0, 4
	la $a0, letterA
	syscall
    	j loop
    	
gradeB:
	li $v0, 4
	la $a0, letterB
	syscall
	j loop
	
gradeC:
	li $v0, 4
	la $a0, letterC
	syscall
	j loop

gradeD:
	li $v0, 4
	la $a0, letterD
	syscall
	j loop
    	
gradeF:
	li $v0, 4
	la $a0, letterF
	syscall
	j loop

#loop to ask a new score if user decide to continue	
loop:
	li $v0, 4
	la $a0, newScore
	syscall
	
	#Get user input's character
	li $v0, 12
	syscall
	
	move $t0, $v0
	
	li $t1, 'y'
	beq $t1, $t0, continue
	
end:
    	# exit 
    	li $v0, 10     
   	syscall
    	
