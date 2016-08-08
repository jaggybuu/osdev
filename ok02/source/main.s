.section .text
.global _start
_start:

	/* put pointer to gpio pin base in r0 */
	ldr r0, =0x20200000

	/* enable pin 16 as output */
	mov r1, #1
	lsl r1, #18
	str r1, [r0, #4]

	loop$:
		/* turn on led */
		mov r1, #1
		lsl r1, #16
		str r1, [r0, #40]

		/* wait for a time */
		mov r2, #0x3F0000
		wait1$:
			sub r2, #1
			cmp r2, #0
			bne wait1$

		/* turn off led */
		mov r1, #1
		lsl r1, #16
		str r1, [r0, #28]

		/* wait again */
		mov r2, #0x3F0000
		wait2$:
			sub r2, #1
			cmp r2, #0
			bne wait2$

		/* loop back again */
		b loop$
