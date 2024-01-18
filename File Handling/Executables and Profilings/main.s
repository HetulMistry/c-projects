	.file	"main.c"
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
	.align 4
LC0:
	.ascii "Enter the name of the input file: \0"
LC1:
	.ascii "%s\0"
LC2:
	.ascii "r\0"
LC3:
	.ascii "Error opening input file\0"
	.align 4
LC4:
	.ascii "Enter the name of the output file: \0"
LC5:
	.ascii "w\0"
LC6:
	.ascii "Error opening output file\0"
LC7:
	.ascii "%d\12\0"
LC8:
	.ascii "%d\0"
	.align 4
LC9:
	.ascii "Operation completed successfully.\0"
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
	subl	$144, %esp
	call	___main
	movl	$LC0, (%esp)
	call	_printf
	leal	78(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_scanf
	movl	$LC2, 4(%esp)
	leal	78(%esp), %eax
	movl	%eax, (%esp)
	call	_fopen
	movl	%eax, 140(%esp)
	cmpl	$0, 140(%esp)
	jne	L2
	movl	$LC3, (%esp)
	call	_perror
	movl	$1, %eax
	jmp	L7
L2:
	movl	$LC4, (%esp)
	call	_printf
	leal	28(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_scanf
	movl	$LC5, 4(%esp)
	leal	28(%esp), %eax
	movl	%eax, (%esp)
	call	_fopen
	movl	%eax, 136(%esp)
	cmpl	$0, 136(%esp)
	jne	L5
	movl	$LC6, (%esp)
	call	_perror
	movl	140(%esp), %eax
	movl	%eax, (%esp)
	call	_fclose
	movl	$1, %eax
	jmp	L7
L6:
	movl	128(%esp), %edx
	movl	128(%esp), %eax
	imull	%edx, %eax
	movl	%eax, 132(%esp)
	movl	132(%esp), %eax
	movl	%eax, 8(%esp)
	movl	$LC7, 4(%esp)
	movl	136(%esp), %eax
	movl	%eax, (%esp)
	call	_fprintf
L5:
	leal	128(%esp), %eax
	movl	%eax, 8(%esp)
	movl	$LC8, 4(%esp)
	movl	140(%esp), %eax
	movl	%eax, (%esp)
	call	_fscanf
	cmpl	$1, %eax
	je	L6
	movl	140(%esp), %eax
	movl	%eax, (%esp)
	call	_fclose
	movl	136(%esp), %eax
	movl	%eax, (%esp)
	call	_fclose
	movl	$LC9, (%esp)
	call	_puts
	call	_getch
	movl	$0, %eax
L7:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE10:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
	.def	_fopen;	.scl	2;	.type	32;	.endef
	.def	_perror;	.scl	2;	.type	32;	.endef
	.def	_fclose;	.scl	2;	.type	32;	.endef
	.def	_fprintf;	.scl	2;	.type	32;	.endef
	.def	_fscanf;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_getch;	.scl	2;	.type	32;	.endef
