	.syntax unified
	.arch armv7-a
	.text

	.equ locked, 1
	.equ unlocked, 0

	.global lock_mutex
	.type lock_mutex, function
lock_mutex:
    @ INSERT CODE BELOW

	ldr r1, =locked @ load const locked into reg1
		
	@ for lock, we need to repeat check until unlock
	@ otherwise it may destroy critical section 
	@ for instance, we use if not while, when another 
	@ process occupies cpu after if then go back
	.lock_loop:
		ldrex r2, [r0]
		cmp r2, unlocked
		strex r2, r1, [r0]
		cmpeq r2, unlocked
		bne .lock_loop @ if not unlock, continue loop check

    @ END CODE INSERT
	bx lr

	.size lock_mutex, .-lock_mutex

	.global unlock_mutex
	.type unlock_mutex, function
unlock_mutex:
	@ INSERT CODE BELOW
	ldr r1, =unlocked @ load const unlocked into reg1
	str r1, [r0]
    @ END CODE INSERT
	bx lr
	.size unlock_mutex, .-unlock_mutex

	.end
