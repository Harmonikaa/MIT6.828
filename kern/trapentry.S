/* See COPYRIGHT for copyright information. */

#include <inc/mmu.h>
#include <inc/memlayout.h>
#include <inc/trap.h>



###################################################################
# exceptions/interrupts
###################################################################

/* TRAPHANDLER defines a globally-visible function for handling a trap.
 * It pushes a trap number onto the stack, then jumps to _alltraps.
 * Use TRAPHANDLER for traps where the CPU automatically pushes an error code.
 *
 * You shouldn't call a TRAPHANDLER function from C, but you may
 * need to _declare_ one in C (for instance, to get a function pointer
 * during IDT setup).  You can declare the function with
 *   void NAME();
 * where NAME is the argument passed to TRAPHANDLER.
 */
#define TRAPHANDLER(name, num)						\
	.globl name;		/* define global symbol for 'name' */	\
	.type name, @function;	/* symbol type is function */		\
	.align 2;		/* align function definition */		\
	name:			/* function starts here */		\
	pushl $(num);							\
	jmp _alltraps

/* Use TRAPHANDLER_NOEC for traps where the CPU doesn't push an error code.
 * It pushes a 0 in place of the error code, so the trap frame has the same
 * format in either case.
 */
#define TRAPHANDLER_NOEC(name, num)					\
	.globl name;							\
	.type name, @function;						\
	.align 2;							\
	name:								\
	pushl $0;							\
	pushl $(num);							\
	jmp _alltraps

.text

/*
 * Lab 3: Your code here for generating entry points for the different traps.
 */
TRAPHANDLER_NOEC(trap_handler_0,0)
TRAPHANDLER_NOEC(trap_handler_1,1)
TRAPHANDLER_NOEC(trap_handler_2,2)
TRAPHANDLER_NOEC(trap_handler_3,3)
TRAPHANDLER_NOEC(trap_handler_4,4)
TRAPHANDLER_NOEC(trap_handler_5,5)
TRAPHANDLER_NOEC(trap_handler_6,6)
TRAPHANDLER_NOEC(trap_handler_7,7)
TRAPHANDLER(trap_handler_8,8)
TRAPHANDLER_NOEC(trap_handler_9,9)
TRAPHANDLER(trap_handler_10,10)
TRAPHANDLER(trap_handler_11,11)
TRAPHANDLER(trap_handler_12,12)
TRAPHANDLER(trap_handler_13,13)
TRAPHANDLER(trap_handler_14,14)
TRAPHANDLER_NOEC(trap_handler_15,15)
TRAPHANDLER_NOEC(trap_handler_16,16)
TRAPHANDLER(trap_handler_17,17)
TRAPHANDLER_NOEC(trap_handler_18,18)
TRAPHANDLER_NOEC(trap_handler_19,19)
TRAPHANDLER_NOEC(trap_handler_20,20)
TRAPHANDLER_NOEC(trap_handler_21,21)
TRAPHANDLER_NOEC(trap_handler_22,22)
TRAPHANDLER_NOEC(trap_handler_23,23)
TRAPHANDLER_NOEC(trap_handler_24,24)
TRAPHANDLER_NOEC(trap_handler_25,25)
TRAPHANDLER_NOEC(trap_handler_26,26)
TRAPHANDLER_NOEC(trap_handler_27,27)
TRAPHANDLER_NOEC(trap_handler_28,28)
TRAPHANDLER_NOEC(trap_handler_29,29)
TRAPHANDLER_NOEC(trap_handler_30,30)
TRAPHANDLER_NOEC(trap_handler_31,31)
TRAPHANDLER_NOEC(trap_handler_32,32)
TRAPHANDLER_NOEC(trap_handler_33,33)
TRAPHANDLER_NOEC(trap_handler_34,34)
TRAPHANDLER_NOEC(trap_handler_35,35)
TRAPHANDLER_NOEC(trap_handler_36,36)
TRAPHANDLER_NOEC(trap_handler_37,37)
TRAPHANDLER_NOEC(trap_handler_38,38)
TRAPHANDLER_NOEC(trap_handler_39,39)
TRAPHANDLER_NOEC(trap_handler_40,40)
TRAPHANDLER_NOEC(trap_handler_41,41)
TRAPHANDLER_NOEC(trap_handler_42,42)
TRAPHANDLER_NOEC(trap_handler_43,43)
TRAPHANDLER_NOEC(trap_handler_44,44)
TRAPHANDLER_NOEC(trap_handler_45,45)
TRAPHANDLER_NOEC(trap_handler_46,46)
TRAPHANDLER_NOEC(trap_handler_47,47)
TRAPHANDLER_NOEC(trap_handler_48,48)


/*
 * Lab 3: Your code here for _alltraps
 */
.globl _alltraps
_alltraps:
	pushl %ds;
	pushl %es;
	pushal;
	movw $GD_KD, %ax;
	movw %ax, %ds;
	movw %ax, %es;
	pushl %esp;
	call trap;

	add $4, %esp;
	popal;
	popl %es;
	popl %ds;
	add $8, %esp;
	iret;

.data
.globl trap_handlers
trap_handlers:
	.long trap_handler_0
	.long trap_handler_1
	.long trap_handler_2
	.long trap_handler_3
	.long trap_handler_4
	.long trap_handler_5
	.long trap_handler_6
	.long trap_handler_7
	.long trap_handler_8
	.long trap_handler_9
	.long trap_handler_10
	.long trap_handler_11
	.long trap_handler_12
	.long trap_handler_13
	.long trap_handler_14
	.long trap_handler_15
	.long trap_handler_16
	.long trap_handler_17
	.long trap_handler_18
	.long trap_handler_19
	.long trap_handler_20
	.long trap_handler_21
	.long trap_handler_22
	.long trap_handler_23
	.long trap_handler_24
	.long trap_handler_25
	.long trap_handler_26
	.long trap_handler_27
	.long trap_handler_28
	.long trap_handler_29
	.long trap_handler_30
	.long trap_handler_31
	.long trap_handler_32
	.long trap_handler_33
	.long trap_handler_34
	.long trap_handler_35
	.long trap_handler_36
	.long trap_handler_37
	.long trap_handler_38
	.long trap_handler_39
	.long trap_handler_40
	.long trap_handler_41
	.long trap_handler_42
	.long trap_handler_43
	.long trap_handler_44
	.long trap_handler_45
	.long trap_handler_46
	.long trap_handler_47
	.long trap_handler_48

