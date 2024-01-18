	.file	"main.c"
	.text
	.globl	_swap
	.def	_swap;	.scl	2;	.type	32;	.endef
_swap:
LFB10:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -4(%ebp)
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, (%eax)
	movl	12(%ebp), %eax
	movl	-4(%ebp), %edx
	movl	%edx, (%eax)
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE10:
	.globl	_bubbleSort
	.def	_bubbleSort;	.scl	2;	.type	32;	.endef
_bubbleSort:
LFB11:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	$0, -4(%ebp)
	jmp	L3
L7:
	movl	$0, -8(%ebp)
	jmp	L4
L6:
	movl	-8(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %edx
	movl	-8(%ebp), %eax
	addl	$1, %eax
	leal	0(,%eax,4), %ecx
	movl	8(%ebp), %eax
	addl	%ecx, %eax
	movl	(%eax), %eax
	cmpl	%eax, %edx
	jle	L5
	movl	-8(%ebp), %eax
	addl	$1, %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%eax, %edx
	movl	-8(%ebp), %eax
	leal	0(,%eax,4), %ecx
	movl	8(%ebp), %eax
	addl	%ecx, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_swap
L5:
	addl	$1, -8(%ebp)
L4:
	movl	12(%ebp), %eax
	subl	-4(%ebp), %eax
	subl	$1, %eax
	cmpl	-8(%ebp), %eax
	jg	L6
	addl	$1, -4(%ebp)
L3:
	movl	12(%ebp), %eax
	subl	$1, %eax
	cmpl	-4(%ebp), %eax
	jg	L7
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE11:
	.section .rdata,"dr"
LC0:
	.ascii "%d \0"
	.text
	.globl	_printArray
	.def	_printArray;	.scl	2;	.type	32;	.endef
_printArray:
LFB12:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, -12(%ebp)
	jmp	L9
L10:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	addl	$1, -12(%ebp)
L9:
	movl	-12(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	L10
	movl	$10, (%esp)
	call	_putchar
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE12:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
	.align 4
LC1:
	.ascii "Enter the number of elements in the array: \0"
LC2:
	.ascii "%d\0"
	.align 4
LC3:
	.ascii "Error: Number of elements exceeds the maximum array size.\0"
	.align 4
LC4:
	.ascii "Enter the elements of the array:\0"
LC5:
	.ascii "Element %d: \0"
LC6:
	.ascii "Unsorted array: \0"
LC7:
	.ascii "Sorted array: \0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB13:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$432, %esp
	call	___main
	movl	$LC1, (%esp)
	call	_printf
	leal	24(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_scanf
	movl	24(%esp), %eax
	cmpl	$100, %eax
	jle	L12
	movl	$LC3, (%esp)
	call	_puts
	movl	$1, %eax
	jmp	L16
L12:
	movl	$LC4, (%esp)
	call	_puts
	movl	$0, 428(%esp)
	jmp	L14
L15:
	movl	428(%esp), %eax
	addl	$1, %eax
	movl	%eax, 4(%esp)
	movl	$LC5, (%esp)
	call	_printf
	leal	28(%esp), %eax
	movl	428(%esp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_scanf
	addl	$1, 428(%esp)
L14:
	movl	24(%esp), %eax
	cmpl	%eax, 428(%esp)
	jl	L15
	movl	$LC6, (%esp)
	call	_printf
	movl	24(%esp), %eax
	movl	%eax, 4(%esp)
	leal	28(%esp), %eax
	movl	%eax, (%esp)
	call	_printArray
	movl	24(%esp), %eax
	movl	%eax, 4(%esp)
	leal	28(%esp), %eax
	movl	%eax, (%esp)
	call	_bubbleSort
	movl	$LC7, (%esp)
	call	_printf
	movl	24(%esp), %eax
	movl	%eax, 4(%esp)
	leal	28(%esp), %eax
	movl	%eax, (%esp)
	call	_printArray
	call	_getch
	movl	$0, %eax
L16:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE13:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_putchar;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_getch;	.scl	2;	.type	32;	.endef
