	.file	"main.c"
	.text
	.globl	_initializeMedication
	.def	_initializeMedication;	.scl	2;	.type	32;	.endef
_initializeMedication:
LFB19:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcpy
	movl	8(%ebp), %eax
	movl	16(%ebp), %edx
	movl	%edx, 52(%eax)
	movl	8(%ebp), %eax
	movl	20(%ebp), %edx
	movl	%edx, 56(%eax)
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
	.section .rdata,"dr"
LC0:
	.ascii "Medication: %s\12\0"
LC1:
	.ascii "Dosage: %d mg\12\0"
LC2:
	.ascii "Next Dose Time: %s\0"
	.text
	.globl	_displayMedication
	.def	_displayMedication;	.scl	2;	.type	32;	.endef
_displayMedication:
LFB20:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	8(%ebp), %eax
	movl	52(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_printf
	movl	8(%ebp), %eax
	addl	$56, %eax
	movl	%eax, (%esp)
	call	_ctime
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_printf
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE20:
	.globl	_updateNextDoseTime
	.def	_updateNextDoseTime;	.scl	2;	.type	32;	.endef
_updateNextDoseTime:
LFB21:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	8(%ebp), %eax
	movl	56(%eax), %edx
	movl	12(%ebp), %eax
	addl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, 56(%eax)
	nop
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE21:
	.section .rdata,"dr"
	.align 4
LC3:
	.ascii "Reminder: It's time to take your medication - %s\12\0"
	.text
	.globl	_remindUser
	.def	_remindUser;	.scl	2;	.type	32;	.endef
_remindUser:
LFB22:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC3, (%esp)
	call	_printf
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE22:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
	.align 4
LC4:
	.ascii "Enter details for Medication 1:\0"
LC5:
	.ascii "Name: \0"
LC6:
	.ascii "%s\0"
LC7:
	.ascii "Dosage (mg): \0"
LC8:
	.ascii "%d\0"
	.align 4
LC9:
	.ascii "Initial Dose Time (in seconds from now): \0"
LC10:
	.ascii "%ld\0"
	.align 4
LC11:
	.ascii "\12Enter details for Medication 2:\0"
LC12:
	.ascii "\12Initial Medication Details:\0"
LC13:
	.ascii "\12Press Enter to exit...\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB23:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$144, %esp
	call	___main
	movl	$LC4, (%esp)
	call	_puts
	movl	$LC5, (%esp)
	call	_printf
	leal	76(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC6, (%esp)
	call	_scanf
	movl	$LC7, (%esp)
	call	_printf
	leal	76(%esp), %eax
	addl	$52, %eax
	movl	%eax, 4(%esp)
	movl	$LC8, (%esp)
	call	_scanf
	movl	$LC9, (%esp)
	call	_printf
	leal	76(%esp), %eax
	addl	$56, %eax
	movl	%eax, 4(%esp)
	movl	$LC10, (%esp)
	call	_scanf
	movl	$0, (%esp)
	call	_time
	movl	%eax, %edx
	movl	132(%esp), %eax
	addl	%edx, %eax
	movl	%eax, 132(%esp)
	movl	$LC11, (%esp)
	call	_puts
	movl	$LC5, (%esp)
	call	_printf
	leal	16(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC6, (%esp)
	call	_scanf
	movl	$LC7, (%esp)
	call	_printf
	leal	16(%esp), %eax
	addl	$52, %eax
	movl	%eax, 4(%esp)
	movl	$LC8, (%esp)
	call	_scanf
	movl	$LC9, (%esp)
	call	_printf
	leal	16(%esp), %eax
	addl	$56, %eax
	movl	%eax, 4(%esp)
	movl	$LC10, (%esp)
	call	_scanf
	movl	$0, (%esp)
	call	_time
	movl	%eax, %edx
	movl	72(%esp), %eax
	addl	%edx, %eax
	movl	%eax, 72(%esp)
	movl	$LC12, (%esp)
	call	_puts
	leal	76(%esp), %eax
	movl	%eax, (%esp)
	call	_displayMedication
	leal	16(%esp), %eax
	movl	%eax, (%esp)
	call	_displayMedication
	movl	$0, 140(%esp)
	jmp	L6
L9:
	movl	$5, (%esp)
	call	_sleep
	movl	$0, (%esp)
	call	_time
	movl	%eax, 136(%esp)
	movl	132(%esp), %eax
	cmpl	136(%esp), %eax
	jg	L7
	leal	76(%esp), %eax
	movl	%eax, (%esp)
	call	_remindUser
	movl	$30, 4(%esp)
	leal	76(%esp), %eax
	movl	%eax, (%esp)
	call	_updateNextDoseTime
L7:
	movl	72(%esp), %eax
	cmpl	136(%esp), %eax
	jg	L8
	leal	16(%esp), %eax
	movl	%eax, (%esp)
	call	_remindUser
	movl	$40, 4(%esp)
	leal	16(%esp), %eax
	movl	%eax, (%esp)
	call	_updateNextDoseTime
L8:
	addl	$1, 140(%esp)
L6:
	cmpl	$4, 140(%esp)
	jle	L9
	movl	$LC13, (%esp)
	call	_printf
	call	_getch
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE23:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_strcpy;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_ctime;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
	.def	_time;	.scl	2;	.type	32;	.endef
	.def	_sleep;	.scl	2;	.type	32;	.endef
	.def	_getch;	.scl	2;	.type	32;	.endef
