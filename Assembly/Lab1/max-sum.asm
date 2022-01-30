.text

############################################################
###     Enter your code here.
###     Write function maxAndSum

# Function to calculate max and sum
# 
# Inputs:
#       $a0: address of array in memory
#       $a1: array size
#
# Outputs:
#       $v0: maximum element of array
#       $v1: summation of array elements
#
# If the array is empty, then the function returns the identity
# (neutral) elements of each corresponding operation, i.e. minimum
# integer for max and zero for sum
#
maxAndSum:
        beq $a1, $zero, L1
		lw $t0, 0($a0)
		add $v0, $zero, $t0
		add $v1, $zero, $t0
		
		LOOP:	
		beq $a1, $zero, L2
		addi $a1, -1
		addi $a0, 4
		lw $t0, 0($a0)
		add $v1, $v1, $t0
		bgt $t0, $v0, L3
		j LOOP
		
		L1:
		li $v0, -2147483648
		li $v1, 0
		jr $ra

		
		L2:
		jr $ra
		
		
		L3:
		add $v0, $t0, $zero
		j LOOP



###     maxAndSum ending
############################################################


############################################################
###     DO NOT CHANGE ANYTHING BELOW !!!


        .data
array_a:.space  1000            # 250 integers

strSize:.asciiz "Enter array size (maximum 250)"

strInp: .asciiz "Enter next number (element "
               
strMax: .asciiz "Max: "

strSum: .asciiz "Sum: "
        


.text
# Entry point for program (main function)
main:

        # original values for *a and i
        la      $s1, array_a    # $s1 = *a
        li      $t0, 0          # $t0 = i

        # display line to input size
        la      $a0, strSize
        jal     printStringln
        
        # get array size
        addi    $v0, $0, 5      # user input
        syscall                   

        move    $s0, $v0        # s0 := n

initLoop:
        beq     $t0, $s0, initDone  # jump if loop finished

        # Display line for next element input
        la      $a0, strInp
        jal     printString

        move    $a0, $t0
        jal     printInteger

        li      $a0, 41         # ')'
        jal     printASCIIln
        
        # Get user input (element a[i])
        addi    $v0, $0, 5        
        syscall
        
        sw      $v0, ($s1)      # store input number in a[i]

        addi    $s1, $s1, 4     # move array pointer
        addi    $t0, $t0, 1     # increase i
        b       initLoop        # loop

initDone: 
        la      $a0, array_a    # first argument is array address
        move    $a1, $s0        # second argument is size of array
        jal     maxAndSum       # call maxAndSum

        move    $s0, $v0        # first return output is max
        move    $s1, $v1        # second return output is sum

        # print results -- max
        la      $a0, strMax
        jal     printString

        move    $a0, $s0
        jal     printIntegerln

        # print results -- sum
        la      $a0, strSum
        jal     printString

        move    $a0, $s1
        jal     printIntegerln

        # exit
        li      $v0, 10
        syscall


# printString -- Print input string to console
#
# Inputs:
#       $a0:    Memory address of string
#
# Outputs:
#       (none)
#       
printString:

        # print input string
        addi    $v0, $0, 4
        syscall

        jr      $ra

# printStringln -- Print input string to console, followed by
#  new line
#
# Inputs:
#       $a0:    Memory address of string
#
# Outputs:
#       (none)
#       
printStringln:

        # print input string
        addi    $v0, $0, 4
        syscall
        
        # print new line
        addi    $v0, $0, 11     # ASCII character print
        li      $a0, 10         # ASCII character new line
        syscall

        jr      $ra

# printInteger -- Print input integer to console
#
# Inputs:
#       $a0:    Integer value
#
# Outputs:
#       (none)
#       
printInteger:

        # print integer
        addi    $v0, $0, 1
        syscall

        jr      $ra

# printIntegerln -- Print input integer to console, followed
#  by new line
#
# Inputs:
#       $a0:    Integer value
#
# Outputs:
#       (none)
#       
printIntegerln:

        # print integer
        addi    $v0, $0, 1
        syscall

        # print new line
        addi    $v0, $0, 11     # ASCII character print
        li      $a0, 10         # ASCII character new line
        syscall

        jr      $ra

# printASCII -- Print input ASCII character to console
#
# Inputs:
#       $a0:    ASCII character to print
#
# Outputs:
#       (none)
#       
printASCII:

        # print ASCII
        addi    $v0, $0, 11
        syscall

        jr      $ra

# printASCIIln -- Print input ASCII character to console, followed
#  by new line
#
# Inputs:
#       $a0:    ASCII character to print
#
# Outputs:
#       (none)
#       
printASCIIln:

        # print ASCII
        addi    $v0, $0, 11
        syscall

        # print new line
        addi    $v0, $0, 11     # ASCII character print
        li      $a0, 10         # ASCII character new line
        syscall

        jr      $ra