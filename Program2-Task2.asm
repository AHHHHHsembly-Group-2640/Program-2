#Group: AHHHH (Khushi Gupta, Remi Ong, Tam Dinh, Viet Nguyen)
#Date: 4/15/2023
#Objective: Program 2 - Practice with Conditionals and Loops - Task 2
#-Write a program in Assembly that takes in two ints from a user. One int will be 'x' and the other will be 'y'. 
#-Make sure that user will know which value is 'x' and 'y'. Find the result of 'x' to the power of 'y'. Output the result to the user. 
#-Include the following in your program:
#-a main label, a looping label, and an exit label
#-a loop counter

#Github link: https://github.com/AHHHHHsembly-Group-2640/Program-2

.data
prompt1: .asciiz "Enter a number for x: "   # prompt message for input of x
prompt2: .asciiz "Enter a number for y: "   # prompt message for input of y
result_msg:  .asciiz "x to the power of y is: " # message for output of result

.text
main:
	# Print the prompt message for input of x to the console
  	li $v0, 4                 # system call code for printing a string
  	la $a0, prompt1           # load the address of the prompt message into $a0
  	syscall                   # execute the system call

  	# Read the user input for x from the keyboard
  	li $v0, 5                 # system call code for reading an integer
  	syscall                   # execute the system call
  	move $s0, $v0             # move the value of x from $v0 to $s0

  	# Print the prompt message for input of y to the console
  	li $v0, 4                 # system call code for printing a string
  	la $a0, prompt2           # load the address of the prompt message into $a0
  	syscall                   # execute the system call

  	# Read the user input for y from the keyboard
  	li $v0, 5                 # system call code for reading an integer
  	syscall                   # execute the system call
  	move $s1, $v0             # move the value of y from $v0 to $s1

  	# Calculate x to the power of y using a loop
  	li $t0, 1                 # initialize the result to 1
  	
loop:
    	beqz $s1, print_result  # if y is 0, jump to print_result
    	mult $t0, $s0           # multiply the result by x
    	mflo $t0                # move the low 32 bits of the product to $t0
    	addi $s1, $s1, -1       # decrement y by 1
    	j loop                  # jump to loop

print_result:
  	# Print the result to the console
  	li $v0, 4                 # system call code for printing a string
  	la $a0, result_msg        # load the address of the message for output of result into $a0
  	syscall                   # execute the system call
  	li $v0, 1                 # system call code for printing an integer
  	move $a0, $t0             # move the value of the result to $a0
  	syscall                   # execute the system call
  	j exit

exit:
  	# Exit the program
  	li $v0, 10                # system call code for exit
  	syscall                   # execute the system call

