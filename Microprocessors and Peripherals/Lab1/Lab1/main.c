__asm int hash(char *str, int *keys)
{
	//*r0 = &str[0], *r1 = &keys[0]
	push {r4-r5, lr}	//Save r4-r5 (preserved registers) and link register (return address)
	mov r2,r0					//*r2 = *r0 = &str[0]
	mov r4,r1					//*r4 = *r1 = &keys[0]
	movs r3,#0				//(sum =) *r3 = 0
	movs r1,#0				//(id =) *r1 = 0
	b start

first_if
	cmp r0,#90
	bgt second_if						//if r0 > 90 goto second_if
	cmp r0,#65
	blt second_if						//if r0 < 65 goto second_if
	sub r5,r0,#65						//*r5 = *r0 - 65
													//[first time it gets here]
													//*r5 = (int)str[1] - 65
	ldr r5,[r4,r5,LSL #2] 	//[first time it gets here]
													//*r5 = the value of address that points to
													// &(*r4 + (*r5 << 2)) = 
													// &(&keys[0] + ((int)str[1] - 65)*4) =
													// &(&keys[0] + 0) => *keys[0]
	add r3,r3,r5						//[first time it gets here]
													//*r3 = *r3 + *r5 = 0 + *keys[0] =
													//(sums += keys[0])
second_if
	cmp r0,#57
	bgt end_ifs							//if r0 > 57 goto end_ifs
	cmp r0,#48
	blt end_ifs							//if r0 < 48 goto end_ifs
	sub r5,r0,#48						//*r5 = *r0 - 48
													//[first time it gets here]
													//*r5 = (int)str[2] - 48
	subs r3,r3,r5						//*r3 -= *r5 =
													//(sums -= *r5)

end_ifs
	adds r1,r1,#1						// *r1 = *r1++ = id++

start
	ldrb r0,[r2,r1]					//[in first loop]
													//*r0 = the value of address that points to 
													// &(*r2+*r1) typecasted to int =
													// (int)*(&str[0]+0) = (int)str[0]
													//[in second loop]
													//*r0 = ... = (int)*(&(&str[0]+1)) = (int)str[1]
	cmp r0,#0	
	bne first_if						//if r0 != 0 goto first_if
	mov r0,r3								//return sum to r0
	pop {r4-r5, pc}					//Pop r4-r5 (preserved registers) and PC (return address)
}
#include <stdio.h>
int main(void)
{
		int keys[26] = {18, 11, 10, 21, 7, 5, 9, 22, 17, 2, 12, 3, 19, 1, 14, 16, 20, 8, 23, 4, 26, 15, 6, 24, 13, 25};
//       keys for  ( A,  B,  C,  D, E, F, G,  H,  I, J,  K, L,  M, N,  O,  P,  Q, R,  S, T,  U,  V, W,  X,  Y,  Z)
		char a[4] = "aA1d";
		int result;
		result = hash(a, keys);
		printf("The hash is: %d", result);
		return 0;
}
