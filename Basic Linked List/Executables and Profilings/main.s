	.file	"main.c"
	.section .rdata,"dr"
LC0:
	.ascii "Memory allocation failed\0"
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
	movl	$8, (%esp)
	call	_malloc
	movl	%eax, -12(%ebp)
	cmpl	$0, -12(%ebp)
	jne	L2
	movl	$LC0, (%esp)
	call	_puts
	movl	$1, (%esp)
	call	_exit
L2:
	movl	-12(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, (%eax)
	movl	-12(%ebp), %eax
	movl	$0, 4(%eax)
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE14:
	.globl	_insertAtBeginning
	.def	_insertAtBeginning;	.scl	2;	.type	32;	.endef
_insertAtBeginning:
LFB15:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_createNode
	movl	%eax, -12(%ebp)
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	-12(%ebp), %eax
	movl	%edx, 4(%eax)
	movl	8(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	%edx, (%eax)
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE15:
	.globl	_insertAtEnd
	.def	_insertAtEnd;	.scl	2;	.type	32;	.endef
_insertAtEnd:
LFB16:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_createNode
	movl	%eax, -16(%ebp)
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L6
	movl	8(%ebp), %eax
	movl	-16(%ebp), %edx
	movl	%edx, (%eax)
	jmp	L5
L6:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
	jmp	L8
L9:
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, -12(%ebp)
L8:
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
	testl	%eax, %eax
	jne	L9
	movl	-12(%ebp), %eax
	movl	-16(%ebp), %edx
	movl	%edx, 4(%eax)
L5:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE16:
	.section .rdata,"dr"
LC1:
	.ascii "Key not found in the list\0"
	.text
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
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
	movl	$0, -16(%ebp)
	cmpl	$0, -12(%ebp)
	je	L13
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	cmpl	12(%ebp), %eax
	jne	L13
	movl	-12(%ebp), %eax
	movl	4(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, (%eax)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_free
	jmp	L10
L15:
	movl	-12(%ebp), %eax
	movl	%eax, -16(%ebp)
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, -12(%ebp)
L13:
	cmpl	$0, -12(%ebp)
	je	L14
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	cmpl	12(%ebp), %eax
	jne	L15
L14:
	cmpl	$0, -12(%ebp)
	jne	L16
	movl	$LC1, (%esp)
	call	_puts
	jmp	L10
L16:
	movl	-12(%ebp), %eax
	movl	4(%eax), %edx
	movl	-16(%ebp), %eax
	movl	%edx, 4(%eax)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_free
L10:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE17:
	.section .rdata,"dr"
LC2:
	.ascii "%d -> \0"
LC3:
	.ascii "NULL\0"
	.text
	.globl	_display
	.def	_display;	.scl	2;	.type	32;	.endef
_display:
LFB18:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	%eax, -12(%ebp)
	jmp	L18
L19:
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_printf
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, -12(%ebp)
L18:
	cmpl	$0, -12(%ebp)
	jne	L19
	movl	$LC3, (%esp)
	call	_puts
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.globl	_freeList
	.def	_freeList;	.scl	2;	.type	32;	.endef
_freeList:
LFB19:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	%eax, -12(%ebp)
	jmp	L21
L22:
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, -16(%ebp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_free
	movl	-16(%ebp), %eax
	movl	%eax, -12(%ebp)
L21:
	cmpl	$0, -12(%ebp)
	jne	L22
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC4:
	.ascii "\12"
	.ascii "1. Insert at the beginning\0"
LC5:
	.ascii "2. Insert at the end\0"
LC6:
	.ascii "3. Delete a node\0"
LC7:
	.ascii "4. Display\0"
LC8:
	.ascii "0. Exit\0"
LC9:
	.ascii "Enter your choice: \0"
LC10:
	.ascii "%d\0"
	.align 4
LC11:
	.ascii "Enter data to insert at the beginning: \0"
	.align 4
LC12:
	.ascii "Enter data to insert at the end: \0"
LC13:
	.ascii "Enter the key to delete: \0"
LC14:
	.ascii "Linked List: \0"
LC15:
	.ascii "Invalid choice\0"
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
	subl	$32, %esp
	call	___main
	movl	$0, 28(%esp)
L32:
	movl	$LC4, (%esp)
	call	_puts
	movl	$LC5, (%esp)
	call	_puts
	movl	$LC6, (%esp)
	call	_puts
	movl	$LC7, (%esp)
	call	_puts
	movl	$LC8, (%esp)
	call	_puts
	movl	$LC9, (%esp)
	call	_printf
	leal	24(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC10, (%esp)
	call	_scanf
	movl	24(%esp), %eax
	cmpl	$4, %eax
	ja	L24
	movl	L26(,%eax,4), %eax
	jmp	*%eax
	.section .rdata,"dr"
	.align 4
L26:
	.long	L34
	.long	L27
	.long	L28
	.long	L29
	.long	L30
	.text
L27:
	movl	$LC11, (%esp)
	call	_printf
	leal	20(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC10, (%esp)
	call	_scanf
	movl	20(%esp), %eax
	movl	%eax, 4(%esp)
	leal	28(%esp), %eax
	movl	%eax, (%esp)
	call	_insertAtBeginning
	jmp	L31
L28:
	movl	$LC12, (%esp)
	call	_printf
	leal	20(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC10, (%esp)
	call	_scanf
	movl	20(%esp), %eax
	movl	%eax, 4(%esp)
	leal	28(%esp), %eax
	movl	%eax, (%esp)
	call	_insertAtEnd
	jmp	L31
L29:
	movl	$LC13, (%esp)
	call	_printf
	leal	16(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC10, (%esp)
	call	_scanf
	movl	16(%esp), %eax
	movl	%eax, 4(%esp)
	leal	28(%esp), %eax
	movl	%eax, (%esp)
	call	_deleteNode
	jmp	L31
L30:
	movl	$LC14, (%esp)
	call	_printf
	movl	28(%esp), %eax
	movl	%eax, (%esp)
	call	_display
	jmp	L31
L24:
	movl	$LC15, (%esp)
	call	_puts
	jmp	L31
L34:
	nop
L31:
	movl	24(%esp), %eax
	testl	%eax, %eax
	jne	L32
	movl	28(%esp), %eax
	movl	%eax, (%esp)
	call	_freeList
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
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_exit;	.scl	2;	.type	32;	.endef
	.def	_free;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
	.def	_getch;	.scl	2;	.type	32;	.endef
