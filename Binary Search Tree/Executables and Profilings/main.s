	.file	"main.c"
	.text
	.globl	_createNode
	.def	_createNode;	.scl	2;	.type	32;	.endef
_createNode:
LFB14:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$12, (%esp)
	call	_malloc
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, (%eax)
	movl	-12(%ebp), %eax
	movl	$0, 8(%eax)
	movl	-12(%ebp), %eax
	movl	8(%eax), %edx
	movl	-12(%ebp), %eax
	movl	%edx, 4(%eax)
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE14:
	.globl	_insert
	.def	_insert;	.scl	2;	.type	32;	.endef
_insert:
LFB15:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	cmpl	$0, 8(%ebp)
	jne	L4
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_createNode
	jmp	L5
L4:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	12(%ebp), %eax
	jle	L6
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_insert
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L7
L6:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	12(%ebp), %eax
	jge	L7
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_insert
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, 8(%eax)
L7:
	movl	8(%ebp), %eax
L5:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE15:
	.globl	_findMin
	.def	_findMin;	.scl	2;	.type	32;	.endef
_findMin:
LFB16:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	jmp	L9
L10:
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 8(%ebp)
L9:
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	testl	%eax, %eax
	jne	L10
	movl	8(%ebp), %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE16:
	.globl	_deleteNode
	.def	_deleteNode;	.scl	2;	.type	32;	.endef
_deleteNode:
LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	cmpl	$0, 8(%ebp)
	jne	L13
	movl	8(%ebp), %eax
	jmp	L14
L13:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	12(%ebp), %eax
	jle	L15
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_deleteNode
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, 4(%eax)
	jmp	L16
L15:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	12(%ebp), %eax
	jge	L17
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_deleteNode
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, 8(%eax)
	jmp	L16
L17:
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	testl	%eax, %eax
	jne	L18
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -12(%ebp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_free
	movl	-12(%ebp), %eax
	jmp	L14
L18:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	testl	%eax, %eax
	jne	L19
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, -16(%ebp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_free
	movl	-16(%ebp), %eax
	jmp	L14
L19:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, (%esp)
	call	_findMin
	movl	%eax, -20(%ebp)
	movl	-20(%ebp), %eax
	movl	(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, (%eax)
	movl	-20(%ebp), %eax
	movl	(%eax), %edx
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_deleteNode
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, 8(%eax)
L16:
	movl	8(%ebp), %eax
L14:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE17:
	.globl	_search
	.def	_search;	.scl	2;	.type	32;	.endef
_search:
LFB18:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	cmpl	$0, 8(%ebp)
	je	L21
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	12(%ebp), %eax
	jne	L22
L21:
	movl	8(%ebp), %eax
	jmp	L23
L22:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	12(%ebp), %eax
	jle	L24
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_search
	jmp	L23
L24:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_search
L23:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.section .rdata,"dr"
LC0:
	.ascii "%d \0"
	.text
	.globl	_inOrderTraversal
	.def	_inOrderTraversal;	.scl	2;	.type	32;	.endef
_inOrderTraversal:
LFB19:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	cmpl	$0, 8(%ebp)
	je	L27
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, (%esp)
	call	_inOrderTraversal
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, (%esp)
	call	_inOrderTraversal
L27:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
	.align 4
LC1:
	.ascii "Enter values to insert into the BST (enter -1 to stop):\0"
LC2:
	.ascii "%d\0"
	.align 4
LC3:
	.ascii "In-order traversal of the BST: \0"
	.align 4
LC4:
	.ascii "Enter a value to search for in the BST: \0"
LC5:
	.ascii "%d found in the BST.\12\0"
LC6:
	.ascii "%d not found in the BST.\12\0"
	.align 4
LC7:
	.ascii "Enter a value to delete from the BST: \0"
	.align 4
LC8:
	.ascii "In-order traversal after deleting %d: \0"
LC9:
	.ascii "Press Enter to exit...\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB20:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$48, %esp
	call	___main
	movl	$0, 44(%esp)
	movl	$LC1, (%esp)
	call	_puts
L31:
	leal	36(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_scanf
	movl	36(%esp), %eax
	cmpl	$-1, %eax
	je	L36
	movl	36(%esp), %eax
	movl	%eax, 4(%esp)
	movl	44(%esp), %eax
	movl	%eax, (%esp)
	call	_insert
	movl	%eax, 44(%esp)
	jmp	L31
L36:
	nop
	movl	$LC3, (%esp)
	call	_printf
	movl	44(%esp), %eax
	movl	%eax, (%esp)
	call	_inOrderTraversal
	movl	$10, (%esp)
	call	_putchar
	movl	$LC4, (%esp)
	call	_printf
	leal	32(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_scanf
	movl	32(%esp), %eax
	movl	%eax, 4(%esp)
	movl	44(%esp), %eax
	movl	%eax, (%esp)
	call	_search
	movl	%eax, 40(%esp)
	cmpl	$0, 40(%esp)
	je	L32
	movl	32(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC5, (%esp)
	call	_printf
	jmp	L33
L32:
	movl	32(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC6, (%esp)
	call	_printf
L33:
	movl	$LC7, (%esp)
	call	_printf
	leal	28(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_scanf
	movl	28(%esp), %eax
	movl	%eax, 4(%esp)
	movl	44(%esp), %eax
	movl	%eax, (%esp)
	call	_deleteNode
	movl	%eax, 44(%esp)
	movl	28(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC8, (%esp)
	call	_printf
	movl	44(%esp), %eax
	movl	%eax, (%esp)
	call	_inOrderTraversal
	movl	$10, (%esp)
	call	_putchar
	movl	44(%esp), %eax
	movl	%eax, (%esp)
	call	_free
	call	_getchar
	movl	$LC9, (%esp)
	call	_printf
	call	_getch
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE20:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_malloc;	.scl	2;	.type	32;	.endef
	.def	_free;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
	.def	_putchar;	.scl	2;	.type	32;	.endef
	.def	_getchar;	.scl	2;	.type	32;	.endef
	.def	_getch;	.scl	2;	.type	32;	.endef
