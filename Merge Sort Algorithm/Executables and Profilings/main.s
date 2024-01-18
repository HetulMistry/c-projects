	.file	"main.c"
	.text
	.globl	_merge
	.def	_merge;	.scl	2;	.type	32;	.endef
_merge:
LFB10:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$52, %esp
	.cfi_offset 3, -12
	movl	%esp, %eax
	movl	%eax, %ebx
	movl	16(%ebp), %eax
	subl	12(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -24(%ebp)
	movl	20(%ebp), %eax
	subl	16(%ebp), %eax
	movl	%eax, -28(%ebp)
	movl	-24(%ebp), %eax
	leal	-1(%eax), %edx
	movl	%edx, -32(%ebp)
	sall	$2, %eax
	leal	3(%eax), %edx
	movl	$16, %eax
	subl	$1, %eax
	addl	%edx, %eax
	movl	$16, %ecx
	movl	$0, %edx
	divl	%ecx
	imull	$16, %eax, %eax
	call	___chkstk_ms
	subl	%eax, %esp
	movl	%esp, %eax
	addl	$3, %eax
	shrl	$2, %eax
	sall	$2, %eax
	movl	%eax, -36(%ebp)
	movl	-28(%ebp), %eax
	leal	-1(%eax), %edx
	movl	%edx, -40(%ebp)
	sall	$2, %eax
	leal	3(%eax), %edx
	movl	$16, %eax
	subl	$1, %eax
	addl	%edx, %eax
	movl	$16, %ecx
	movl	$0, %edx
	divl	%ecx
	imull	$16, %eax, %eax
	call	___chkstk_ms
	subl	%eax, %esp
	movl	%esp, %eax
	addl	$3, %eax
	shrl	$2, %eax
	sall	$2, %eax
	movl	%eax, -44(%ebp)
	movl	$0, -12(%ebp)
	jmp	L2
L3:
	movl	12(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %ecx
	movl	-36(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	%ecx, (%eax,%edx,4)
	addl	$1, -12(%ebp)
L2:
	movl	-12(%ebp), %eax
	cmpl	-24(%ebp), %eax
	jl	L3
	movl	$0, -16(%ebp)
	jmp	L4
L5:
	movl	16(%ebp), %eax
	leal	1(%eax), %edx
	movl	-16(%ebp), %eax
	addl	%edx, %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %ecx
	movl	-44(%ebp), %eax
	movl	-16(%ebp), %edx
	movl	%ecx, (%eax,%edx,4)
	addl	$1, -16(%ebp)
L4:
	movl	-16(%ebp), %eax
	cmpl	-28(%ebp), %eax
	jl	L5
	movl	$0, -12(%ebp)
	movl	$0, -16(%ebp)
	movl	12(%ebp), %eax
	movl	%eax, -20(%ebp)
	jmp	L6
L10:
	movl	-36(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	(%eax,%edx,4), %ecx
	movl	-44(%ebp), %eax
	movl	-16(%ebp), %edx
	movl	(%eax,%edx,4), %eax
	cmpl	%eax, %ecx
	jg	L7
	movl	-20(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	-36(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	(%eax,%edx,4), %eax
	movl	%eax, (%ecx)
	addl	$1, -12(%ebp)
	jmp	L8
L7:
	movl	-20(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	-44(%ebp), %eax
	movl	-16(%ebp), %edx
	movl	(%eax,%edx,4), %eax
	movl	%eax, (%ecx)
	addl	$1, -16(%ebp)
L8:
	addl	$1, -20(%ebp)
L6:
	movl	-12(%ebp), %eax
	cmpl	-24(%ebp), %eax
	jge	L11
	movl	-16(%ebp), %eax
	cmpl	-28(%ebp), %eax
	jl	L10
	jmp	L11
L12:
	movl	-20(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	-36(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	(%eax,%edx,4), %eax
	movl	%eax, (%ecx)
	addl	$1, -12(%ebp)
	addl	$1, -20(%ebp)
L11:
	movl	-12(%ebp), %eax
	cmpl	-24(%ebp), %eax
	jl	L12
	jmp	L13
L14:
	movl	-20(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	-44(%ebp), %eax
	movl	-16(%ebp), %edx
	movl	(%eax,%edx,4), %eax
	movl	%eax, (%ecx)
	addl	$1, -16(%ebp)
	addl	$1, -20(%ebp)
L13:
	movl	-16(%ebp), %eax
	cmpl	-28(%ebp), %eax
	jl	L14
	movl	%ebx, %esp
	nop
	movl	-4(%ebp), %ebx
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE10:
	.globl	_mergeSort
	.def	_mergeSort;	.scl	2;	.type	32;	.endef
_mergeSort:
LFB11:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	12(%ebp), %eax
	cmpl	16(%ebp), %eax
	jge	L17
	movl	16(%ebp), %eax
	subl	12(%ebp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_mergeSort
	movl	-12(%ebp), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	%edx, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_mergeSort
	movl	16(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_merge
L17:
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
	jmp	L19
L20:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	addl	$1, -12(%ebp)
L19:
	movl	-12(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	L20
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
LC1:
	.ascii "Enter the size of the array: \0"
LC2:
	.ascii "%d\0"
	.align 4
LC3:
	.ascii "Invalid array size. Exiting...\0"
	.align 4
LC4:
	.ascii "Enter %d elements for the array:\12\0"
LC5:
	.ascii "Element %d: \0"
LC6:
	.ascii "Given array is \0"
LC7:
	.ascii "\12Sorted array is \0"
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
	jg	L22
	movl	24(%esp), %eax
	testl	%eax, %eax
	jg	L23
L22:
	movl	$LC3, (%esp)
	call	_puts
	movl	$1, %eax
	jmp	L27
L23:
	movl	24(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf
	movl	$0, 428(%esp)
	jmp	L25
L26:
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
L25:
	movl	24(%esp), %eax
	cmpl	%eax, 428(%esp)
	jl	L26
	movl	$LC6, (%esp)
	call	_puts
	movl	24(%esp), %eax
	movl	%eax, 4(%esp)
	leal	28(%esp), %eax
	movl	%eax, (%esp)
	call	_printArray
	movl	24(%esp), %eax
	subl	$1, %eax
	movl	%eax, 8(%esp)
	movl	$0, 4(%esp)
	leal	28(%esp), %eax
	movl	%eax, (%esp)
	call	_mergeSort
	movl	$LC7, (%esp)
	call	_puts
	movl	24(%esp), %eax
	movl	%eax, 4(%esp)
	leal	28(%esp), %eax
	movl	%eax, (%esp)
	call	_printArray
	call	_getch
	movl	$0, %eax
L27:
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
