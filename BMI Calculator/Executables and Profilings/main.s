	.file	"main.c"
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
	.align 4
LC0:
	.ascii "Enter your weight in kilograms: \0"
LC1:
	.ascii "%f\0"
LC2:
	.ascii "Enter your height in meters: \0"
LC3:
	.ascii "Your BMI is: %.2f\12\0"
LC5:
	.ascii "Underweight\0"
LC7:
	.ascii "Normal weight\0"
LC9:
	.ascii "Overweight\0"
LC10:
	.ascii "Obese\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB10:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$32, %esp
	call	___main
	movl	$LC0, (%esp)
	call	_printf
	leal	24(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_scanf
	movl	$LC2, (%esp)
	call	_printf
	leal	20(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_scanf
	flds	24(%esp)
	flds	20(%esp)
	flds	20(%esp)
	fmulp	%st, %st(1)
	fdivrp	%st, %st(1)
	fstps	28(%esp)
	flds	28(%esp)
	fstpl	4(%esp)
	movl	$LC3, (%esp)
	call	_printf
	flds	LC4
	flds	28(%esp)
	fxch	%st(1)
	fucompp
	fnstsw	%ax
	sahf
	jbe	L17
	movl	$LC5, (%esp)
	call	_puts
	jmp	L4
L17:
	flds	28(%esp)
	flds	LC4
	fxch	%st(1)
	fucompp
	fnstsw	%ax
	sahf
	jb	L5
	flds	LC6
	flds	28(%esp)
	fxch	%st(1)
	fucompp
	fnstsw	%ax
	sahf
	jbe	L5
	movl	$LC7, (%esp)
	call	_puts
	jmp	L4
L5:
	flds	28(%esp)
	flds	LC6
	fxch	%st(1)
	fucompp
	fnstsw	%ax
	sahf
	jb	L8
	flds	LC8
	flds	28(%esp)
	fxch	%st(1)
	fucompp
	fnstsw	%ax
	sahf
	jbe	L8
	movl	$LC9, (%esp)
	call	_puts
	jmp	L4
L8:
	movl	$LC10, (%esp)
	call	_puts
L4:
	call	_getch
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE10:
	.section .rdata,"dr"
	.align 4
LC4:
	.long	1100218368
	.align 4
LC6:
	.long	1103626240
	.align 4
LC8:
	.long	1106247680
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_getch;	.scl	2;	.type	32;	.endef
