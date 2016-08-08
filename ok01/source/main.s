.section .text
.global _start
_start:

	/* put pointer to gpio pin base in r0 */
	ldr r0, =0x20200000

	/* enable pin 16 as output */
	mov r1, #1
	lsl r1, #18
	str r1, [r0, #4]

	/* turn on led */
	mov r1, #1
	lsl r1, #16
	str r1, [r0, #40]

	/* loop forever so pi doesnt crash */
	loop$:
		b loop$
