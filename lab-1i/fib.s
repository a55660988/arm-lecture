	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	push {r3, r4, r5, lr}

	@ r0 is input from user
	@ previous is -1
	mov r3, #(-1)
	@ result = 1
	mov r4, #1
	@ ensure r5 for sum is initialized as zero
	mov r5, #0

	.loop:
		add r5, r4, r3
		mov r3, r4
		mov r4, r5
		@ check loop condition
		subs r0, #1
		ite lt
		movlt r0, r3
		bge .loop

	pop {r3, r4, r5, pc}		@EPILOG

	@ END CODE MODIFICATION

	.size fibonacci, .-fibonacci
	.end
