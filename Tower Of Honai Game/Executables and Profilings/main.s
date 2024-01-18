	.file	"main.c"
	.section .rdata,"dr"
LC0:
	.ascii "Move disk 1 from %c to %c\12\0"
LC1:
	.ascii "Move disk %d from %c to %c\12\0"
	.text
	.globl	_towerOfHanoi
	.def	_towerOfHanoi;	.scl	2;	.type	32;	.endef
_towerOfHanoi:
LFB10:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$36, %esp
	.cfi_offset 3, -12
	movl	12(%ebp), %ecx
	movl	16(%ebp), %edx
	movl	20(%ebp), %eax
	movb	%cl, -12(%ebp)
	movb	%dl, -16(%ebp)
	movb	%al, -20(%ebp)
	cmpl	$1, 8(%ebp)
	jne	L2
	movsbl	-20(%ebp), %edx
	movsbl	-12(%ebp), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	jmp	L1
L2:
	movsbl	-16(%ebp), %ecx
	movsbl	-20(%ebp), %edx
	movsbl	-12(%ebp), %eax
	movl	8(%ebp), %ebx
	subl	$1, %ebx
	movl	%ecx, 12(%esp)
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	_towerOfHanoi
	movsbl	-20(%ebp), %edx
	movsbl	-12(%ebp), %eax
	movl	%edx, 12(%esp)
	movl	%eax, 8(%esp)
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_printf
	movsbl	-20(%ebp), %ecx
	movsbl	-12(%ebp), %edx
	movsbl	-16(%ebp), %eax
	movl	8(%ebp), %ebx
	subl	$1, %ebx
	movl	%ecx, 12(%esp)
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	_towerOfHanoi
L1:
	addl	$36, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE10:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC2:
	.ascii "Enter the number of disks: \0"
LC3:
	.ascii "%d\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB11:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$32, %esp
	call	___main
	movl	$LC2, (%esp)
	call	_printf
	leal	28(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC3, (%esp)
	call	_scanf
	movl	28(%esp), %eax
	movl	$67, 12(%esp)
	movl	$66, 8(%esp)
	movl	$65, 4(%esp)
	movl	%eax, (%esp)
	call	_towerOfHanoi
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE11:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
