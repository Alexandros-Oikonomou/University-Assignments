.text

############################################################
###     Enter your code here.
###     Write function addhalf

# addhalf -- Add two half-precision floating point numbers using
# integer operations.
#
# Inputs:
#       $a0:    1st FP16 (half)
#       $a1:    2nd FP16 (half)
# Outputs:
#       $v0:    $a0 + $a1 in FP16 (half) format
#   
# NOTE
#   This function only implements base case scenario. It does not
#   take into account corner cases. It should include the cases when
#   the output is equal to zero or both inputs are equal to zero.
#
#   Validate following inputs:
#      0.0 +  0.0 =  0.0
#      1.0 + -1.0 =  0.0
#      0.1 +  0.0 =  0.1
#     -0.1 +  0.0 = -0.1
#     
addhalf:
	beq		$a0, $zero, azero	
	beq		$a1, $zero, bzero	
	li		$t0, 0x8000			
	and		$t1, $a0, $t0		
	and		$t2, $a1, $t0		
	li		$t0, 0x7C00			
	and		$t3, $a0, $t0		
	and		$t4, $a1, $t0		
	li		$t0, 0x03FF			
	and		$a0, $a0, $t0		
	and		$a1, $a1, $t0		
	addiu	$a0, $a0, 1024		
	addiu	$a1, $a1, 1024		
	blt		$t4, $t3, ExponentB
	blt		$t3, $t4, ExponentA
	
ExponentBack:
	bgt $a0, $a1, MantSign
	addu $v0, $zero, $t2

MantBack:
	beq $t1, $t2, EqAdd
	beq $t1, $v0, AAdd
	beq $t2, $v0, BAdd
	
AddBack:
	beq $t0, $zero, EZero
	li $t5, 1024
	blt $t0, $t5, MantiAdjust
	li $t5, 2048
	bgt $t0, $t5, MantiAdjustDown
	
FAdjBack:
	li $t5, 1024
	subu $t0, $t0, $t5
	addu $v0, $v0, $t0
	addu $v0, $v0, $t3
	j exit	
	
MantiAdjust:
	bgt $t0, $t5, FAdjBack
	beq $t0, $t5, FAdjBack
	sll $t0, $t0, 1
	subu $t3, $t3, $t5
	j MantiAdjust		
	
MantiAdjustDown:
	blt $t0, $t5, FAdjBack
	srl $t0, $t0, 1
	addu $t3, $t3, $t5
	j MantiAdjustDown	
	
AAdd:
	subu $t0, $a0, $a1
	j AddBack

BAdd:
	subu  $t0, $a1, $a0
	j AddBack

EqAdd:
	addu $t0, $a0, $a1
	j AddBack

MantSign:
	addu $v0, $zero, $t1	
	j MantBack

	
	
ExponentB:
	beq $t3, $t4, ExponentBack
	addiu $t4, $t4, 1024
	srl $a1, $a1, 1
	j ExponentB
	
ExponentA:
	beq $t3, $t4, ExponentBack
	addiu $t3, $t3, 1024
	srl $a0, $a0, 1
	j ExponentA
	
azero:
	add $v0, $a1, $zero
	j exit
bzero:
	add $v0, $a0, $zero
	j exit
	
EZero:
	li $v0, 0
	j exit
	
exit:
	jr $ra

	
###     addhalf ending
############################################################

        
############################################################
###     DO NOT CHANGE ANYTHING BELOW !!!

        
.data

strInputFirst:
        .asciiz "Input first floating point number: "

strInputSecond:
        .asciiz "Input second floating point number: "

strResult:
        .asciiz "Result: "

.text
        
        .globl  main
main:

        # request first floating point number
        la      $a0, strInputFirst
        jal     printString
        li      $v0, 6
        syscall

        # move number to integer register s0
        mfc1    $s0, $f0

        # request second floating point number
        la      $a0, strInputSecond
        jal     printString
        li      $v0, 6
        syscall

        # move number to integer register s1
        mfc1    $s1, $f0

        # transform 1st float to half
        move    $a0, $s0
        jal     float2half
        move    $s0, $v0

        # transform 2nd float to half
        move    $a0, $s1
        jal     float2half
        move    $s1, $v0

        # add 2 half numbers
        move    $a0, $s0
        move    $a1, $s1
        jal     addhalf

        # transform to full float
        move    $a0, $v0
        jal     half2float
        
        # print result
        mtc1    $v0, $f12
        la      $a0, strResult
        jal     printString        
        jal     printFloatln
        
        # exit
        li      $v0, 10
        syscall
        

# float2half -- Convert a full precision floating point to half
# precision
#
# Inputs:
#       $a0:    FP32 number
# Outputs:
#       $v0:    FP16 number
#
float2half:
        ## prepare exp
        srl     $t0, $a0, 23    # e = a >> 23
        andi    $t0, $t0, 0xff  # e = e & 0xff
        addi    $t0, $t0, -127  # e -= 127 -- unbias
        addi    $t0, $t0, 15    # e += 15  -- rebias
        sll     $t0, $t0, 10    # e << 10

        ## prepare sgn
        srl     $t1, $a0, 16     # s = a >> 16
        andi    $t1, $t1, 0x8000 # s = s && 0x8000

        ## prepare mantissa
        srl     $t2, $a0, 13     # m = a >> 13
        andi    $t2, $t2, 0x03ff # m = a & 0x03ff

        ## check if zero, otherwise transform
        
        slti    $t6, $t0, -15         # if e < -15
        beqz    $t6, float2half_build #
        move    $v0, $0               #   result = 0
        jr      $ra                   #   return result
                                      # 
float2half_build:                     # else
        or      $v0, $t0, $t1         #   result = e | s
        or      $v0, $v0, $t2         #                  | m
                                      # endif
        jr      $ra                   # return result


# half2float -- Convert a half precision floating point to full
# precision
#
# Inputs:
#       $a0:    FP16 number
# Outputs:
#       $v0:    FP32 number
#
half2float:
        # prepare exp
        andi    $t0, $a0, 0x7c00 # e = a & 0x7c00
        srl     $t0, $t0, 10     # e = e >> 10

        # prepare sgn
        andi    $t1, $a0, 0x8000 # s = a & 0x8000
        sll     $t1, $t1, 16     # s <<= 16

        # prepare mantissa
        andi    $t2, $a0, 0x03ff # m = a & 0x03ff
        sll     $t2, $t2, 13     # m <<= 13

        ## check if zero, otherwise transform
        beqz    $t0, res_0            # if e > 0
        addi    $t0, $t0, 127         #   e += 127 -- unbias
        addi    $t0, $t0, -15         #   e -= 15  -- rebias
        sll     $t0, $t0, 23          #   e <<= 23
        or      $v0, $t0, $t1         #   result = e | s
        or      $v0, $v0, $t2         #                  | m
        jr      $ra                   #   return result
res_0:                                # else
        move    $v0, $0               #   result = 0
        jr      $ra                   #   return result
                                      # endif 
        
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


# printFloat -- Print input float to console, followed by new line
#
# Inputs:
#       $f12:    Float value
#
# Outputs:
#       (none)
#       
printFloatln:

        # print float
        li      $v0, 2
        syscall

        # print new line
        addi    $v0, $0, 11     # ASCII character print
        li      $a0, 10         # ASCII character new line
        syscall

        jr      $ra
