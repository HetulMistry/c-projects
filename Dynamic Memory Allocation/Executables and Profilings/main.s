	.file	"main.c"
	.text
	.globl	_allocateMemory
	.def	_allocateMemory;	.scl	2;	.type	32;	.endef
_allocateMemory:
LFB14:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$36, %esp
	.cfi_offset 3, -12
	movl	8(%ebp), %eax
	sall	$2, %eax
	movl	%eax, (%esp)
	call	_malloc
	movl	%eax, -16(%ebp)
	movl	$0, -12(%ebp)
	jmp	L2
L3:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	-16(%ebp), %eax
	leal	(%edx,%eax), %ebx
	movl	12(%ebp), %eax
	sall	$2, %eax
	movl	%eax, (%esp)
	call	_malloc
	movl	%eax, (%ebx)
	addl	$1, -12(%ebp)
L2:
	movl	-12(%ebp), %eax
	cmpl	8(%ebp), %eax
	jl	L3
	movl	-16(%ebp), %eax
	addl	$36, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE14:
	.globl	_freeMemory
	.def	_freeMemory;	.scl	2;	.type	32;	.endef
_freeMemory:
LFB15:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, -12(%ebp)
	jmp	L6
L7:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	_free
	addl	$1, -12(%ebp)
L6:
	movl	-12(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	L7
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_free
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE15:
	.section .rdata,"dr"
	.align 4
LC0:
	.ascii "Matrix multiplication not possible!\0"
	.text
	.globl	_matrixMultiply
	.def	_matrixMultiply;	.scl	2;	.type	32;	.endef
_matrixMultiply:
LFB16:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	subl	$32, %esp
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	movl	16(%ebp), %eax
	cmpl	24(%ebp), %eax
	je	L9
	movl	$LC0, (%esp)
	call	_puts
	movl	$0, %eax
	jmp	L10
L9:
	movl	28(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_allocateMemory
	movl	%eax, -24(%ebp)
	movl	$0, -12(%ebp)
	jmp	L11
L16:
	movl	$0, -16(%ebp)
	jmp	L12
L15:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	-24(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	-16(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	$0, (%eax)
	movl	$0, -20(%ebp)
	jmp	L13
L14:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	-24(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	-16(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	-12(%ebp), %edx
	leal	0(,%edx,4), %ecx
	movl	-24(%ebp), %edx
	addl	%ecx, %edx
	movl	(%edx), %edx
	movl	-16(%ebp), %ecx
	sall	$2, %ecx
	addl	%ecx, %edx
	movl	(%edx), %ecx
	movl	-12(%ebp), %edx
	leal	0(,%edx,4), %ebx
	movl	8(%ebp), %edx
	addl	%ebx, %edx
	movl	(%edx), %edx
	movl	-20(%ebp), %ebx
	sall	$2, %ebx
	addl	%ebx, %edx
	movl	(%edx), %ebx
	movl	-20(%ebp), %edx
	leal	0(,%edx,4), %esi
	movl	20(%ebp), %edx
	addl	%esi, %edx
	movl	(%edx), %edx
	movl	-16(%ebp), %esi
	sall	$2, %esi
	addl	%esi, %edx
	movl	(%edx), %edx
	imull	%ebx, %edx
	addl	%ecx, %edx
	movl	%edx, (%eax)
	addl	$1, -20(%ebp)
L13:
	movl	-20(%ebp), %eax
	cmpl	16(%ebp), %eax
	jl	L14
	addl	$1, -16(%ebp)
L12:
	movl	-16(%ebp), %eax
	cmpl	28(%ebp), %eax
	jl	L15
	addl	$1, -12(%ebp)
L11:
	movl	-12(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	L16
	movl	-24(%ebp), %eax
L10:
	addl	$32, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE16:
	.globl	_transposeMatrix
	.def	_transposeMatrix;	.scl	2;	.type	32;	.endef
_transposeMatrix:
LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	16(%ebp), %eax
	movl	%eax, (%esp)
	call	_allocateMemory
	movl	%eax, -20(%ebp)
	movl	$0, -12(%ebp)
	jmp	L18
L21:
	movl	$0, -16(%ebp)
	jmp	L19
L20:
	movl	-16(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	-12(%ebp), %edx
	sall	$2, %edx
	addl	%eax, %edx
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %ecx
	movl	8(%ebp), %eax
	addl	%ecx, %eax
	movl	(%eax), %eax
	movl	-16(%ebp), %ecx
	sall	$2, %ecx
	addl	%ecx, %eax
	movl	(%eax), %eax
	movl	%eax, (%edx)
	addl	$1, -16(%ebp)
L19:
	movl	-16(%ebp), %eax
	cmpl	16(%ebp), %eax
	jl	L20
	addl	$1, -12(%ebp)
L18:
	movl	-12(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	L21
	movl	-20(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE17:
	.section .rdata,"dr"
LC1:
	.ascii "%d\11\0"
	.text
	.globl	_printMatrix
	.def	_printMatrix;	.scl	2;	.type	32;	.endef
_printMatrix:
LFB18:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, -12(%ebp)
	jmp	L24
L27:
	movl	$0, -16(%ebp)
	jmp	L25
L26:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	-16(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_printf
	addl	$1, -16(%ebp)
L25:
	movl	-16(%ebp), %eax
	cmpl	16(%ebp), %eax
	jl	L26
	movl	$10, (%esp)
	call	_putchar
	addl	$1, -12(%ebp)
L24:
	movl	-12(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	L27
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
	.align 4
LC2:
	.ascii "Enter dimensions of matrix 1 (rows columns): \0"
LC3:
	.ascii "%d %d\0"
	.align 4
LC4:
	.ascii "Enter dimensions of matrix 2 (rows columns): \0"
LC5:
	.ascii "Enter elements of matrix 1:\0"
LC6:
	.ascii "%d\0"
LC7:
	.ascii "Enter elements of matrix 2:\0"
LC8:
	.ascii "\12Matrix 1:\0"
LC9:
	.ascii "\12Matrix 2:\0"
LC10:
	.ascii "\12Matrix Multiplication:\0"
LC11:
	.ascii "\12Matrix 1 Transpose:\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB19:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	andl	$-16, %esp
	subl	$80, %esp
	.cfi_offset 3, -12
	call	___main
	movl	$LC2, (%esp)
	call	_printf
	leal	40(%esp), %eax
	movl	%eax, 8(%esp)
	leal	44(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC3, (%esp)
	call	_scanf
	movl	$LC4, (%esp)
	call	_printf
	leal	32(%esp), %eax
	movl	%eax, 8(%esp)
	leal	36(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC3, (%esp)
	call	_scanf
	movl	40(%esp), %edx
	movl	44(%esp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_allocateMemory
	movl	%eax, 60(%esp)
	movl	32(%esp), %edx
	movl	36(%esp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_allocateMemory
	movl	%eax, 56(%esp)
	movl	$LC5, (%esp)
	call	_puts
	movl	$0, 76(%esp)
	jmp	L29
L32:
	movl	$0, 72(%esp)
	jmp	L30
L31:
	movl	76(%esp), %eax
	leal	0(,%eax,4), %edx
	movl	60(%esp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	72(%esp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	%eax, 4(%esp)
	movl	$LC6, (%esp)
	call	_scanf
	addl	$1, 72(%esp)
L30:
	movl	40(%esp), %eax
	cmpl	%eax, 72(%esp)
	jl	L31
	addl	$1, 76(%esp)
L29:
	movl	44(%esp), %eax
	cmpl	%eax, 76(%esp)
	jl	L32
	movl	$LC7, (%esp)
	call	_puts
	movl	$0, 68(%esp)
	jmp	L33
L36:
	movl	$0, 64(%esp)
	jmp	L34
L35:
	movl	68(%esp), %eax
	leal	0(,%eax,4), %edx
	movl	56(%esp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	64(%esp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	%eax, 4(%esp)
	movl	$LC6, (%esp)
	call	_scanf
	addl	$1, 64(%esp)
L34:
	movl	32(%esp), %eax
	cmpl	%eax, 64(%esp)
	jl	L35
	addl	$1, 68(%esp)
L33:
	movl	36(%esp), %eax
	cmpl	%eax, 68(%esp)
	jl	L36
	movl	32(%esp), %ebx
	movl	36(%esp), %ecx
	movl	40(%esp), %edx
	movl	44(%esp), %eax
	movl	%ebx, 20(%esp)
	movl	%ecx, 16(%esp)
	movl	56(%esp), %ecx
	movl	%ecx, 12(%esp)
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	60(%esp), %eax
	movl	%eax, (%esp)
	call	_matrixMultiply
	movl	%eax, 52(%esp)
	movl	40(%esp), %edx
	movl	44(%esp), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	60(%esp), %eax
	movl	%eax, (%esp)
	call	_transposeMatrix
	movl	%eax, 48(%esp)
	movl	$LC8, (%esp)
	call	_puts
	movl	40(%esp), %edx
	movl	44(%esp), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	60(%esp), %eax
	movl	%eax, (%esp)
	call	_printMatrix
	movl	$LC9, (%esp)
	call	_puts
	movl	32(%esp), %edx
	movl	36(%esp), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	56(%esp), %eax
	movl	%eax, (%esp)
	call	_printMatrix
	movl	$LC10, (%esp)
	call	_puts
	movl	32(%esp), %edx
	movl	44(%esp), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	52(%esp), %eax
	movl	%eax, (%esp)
	call	_printMatrix
	movl	$LC11, (%esp)
	call	_puts
	movl	44(%esp), %edx
	movl	40(%esp), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	48(%esp), %eax
	movl	%eax, (%esp)
	call	_printMatrix
	movl	44(%esp), %eax
	movl	%eax, 4(%esp)
	movl	60(%esp), %eax
	movl	%eax, (%esp)
	call	_freeMemory
	movl	36(%esp), %eax
	movl	%eax, 4(%esp)
	movl	56(%esp), %eax
	movl	%eax, (%esp)
	call	_freeMemory
	movl	44(%esp), %eax
	movl	%eax, 4(%esp)
	movl	52(%esp), %eax
	movl	%eax, (%esp)
	call	_freeMemory
	movl	40(%esp), %eax
	movl	%eax, 4(%esp)
	movl	48(%esp), %eax
	movl	%eax, (%esp)
	call	_freeMemory
	call	_getch
	movl	$0, %eax
	movl	-4(%ebp), %ebx
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_malloc;	.scl	2;	.type	32;	.endef
	.def	_free;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_putchar;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
	.def	_getch;	.scl	2;	.type	32;	.endef
