	.file	"main.c"
	.section .rdata,"dr"
LC0:
	.ascii "Enter book title: \0"
LC1:
	.ascii "%s\0"
LC2:
	.ascii "Enter author name: \0"
	.text
	.globl	_addBook
	.def	_addBook;	.scl	2;	.type	32;	.endef
_addBook:
LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	$LC0, (%esp)
	call	_printf
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	imull	$156, %eax, %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_scanf
	movl	$LC2, (%esp)
	call	_printf
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	imull	$156, %eax, %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	addl	$100, %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_scanf
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	imull	$156, %eax, %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	$0, 152(%eax)
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	leal	1(%eax), %edx
	movl	12(%ebp), %eax
	movl	%edx, (%eax)
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE17:
	.section .rdata,"dr"
LC3:
	.ascii "Enter the title to search: \0"
LC4:
	.ascii "Yes\0"
LC5:
	.ascii "No\0"
	.align 4
LC6:
	.ascii "Book found:\12Title: %s\12Author: %s\12Borrowed: %s\12\0"
LC7:
	.ascii "Book not found.\0"
	.text
	.globl	_searchBook
	.def	_searchBook;	.scl	2;	.type	32;	.endef
_searchBook:
LFB18:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$132, %esp
	.cfi_offset 3, -12
	movl	$LC3, (%esp)
	call	_printf
	leal	-116(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_scanf
	movl	$0, -12(%ebp)
	movl	$0, -16(%ebp)
	jmp	L3
L8:
	movl	-16(%ebp), %eax
	imull	$156, %eax, %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, %edx
	leal	-116(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L4
	movl	-16(%ebp), %eax
	imull	$156, %eax, %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	152(%eax), %eax
	testl	%eax, %eax
	je	L5
	movl	$LC4, %ebx
	jmp	L6
L5:
	movl	$LC5, %ebx
L6:
	movl	-16(%ebp), %eax
	imull	$156, %eax, %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	addl	$100, %eax
	movl	-16(%ebp), %edx
	imull	$156, %edx, %ecx
	movl	8(%ebp), %edx
	addl	%ecx, %edx
	movl	%ebx, 12(%esp)
	movl	%eax, 8(%esp)
	movl	%edx, 4(%esp)
	movl	$LC6, (%esp)
	call	_printf
	movl	$1, -12(%ebp)
	jmp	L7
L4:
	addl	$1, -16(%ebp)
L3:
	movl	-16(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	L8
L7:
	cmpl	$0, -12(%ebp)
	jne	L10
	movl	$LC7, (%esp)
	call	_puts
L10:
	nop
	addl	$132, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.section .rdata,"dr"
LC8:
	.ascii "Library Catalog:\0"
	.align 4
LC9:
	.ascii "%d. Title: %s\12   Author: %s\12   Borrowed: %s\12\0"
	.text
	.globl	_displayBooks
	.def	_displayBooks;	.scl	2;	.type	32;	.endef
_displayBooks:
LFB19:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$52, %esp
	.cfi_offset 3, -12
	movl	$LC8, (%esp)
	call	_puts
	movl	$0, -12(%ebp)
	jmp	L12
L15:
	movl	-12(%ebp), %eax
	imull	$156, %eax, %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	152(%eax), %eax
	testl	%eax, %eax
	je	L13
	movl	$LC4, %ebx
	jmp	L14
L13:
	movl	$LC5, %ebx
L14:
	movl	-12(%ebp), %eax
	imull	$156, %eax, %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	leal	100(%eax), %edx
	movl	-12(%ebp), %eax
	imull	$156, %eax, %ecx
	movl	8(%ebp), %eax
	addl	%ecx, %eax
	movl	%eax, %ecx
	movl	-12(%ebp), %eax
	addl	$1, %eax
	movl	%ebx, 16(%esp)
	movl	%edx, 12(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC9, (%esp)
	call	_printf
	addl	$1, -12(%ebp)
L12:
	movl	-12(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	L15
	nop
	addl	$52, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
	.globl	_sortBooks
	.def	_sortBooks;	.scl	2;	.type	32;	.endef
_sortBooks:
LFB20:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$204, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movl	$0, -28(%ebp)
	jmp	L17
L21:
	movl	-28(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -32(%ebp)
	jmp	L18
L20:
	movl	-32(%ebp), %eax
	imull	$156, %eax, %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, %ecx
	movl	-28(%ebp), %eax
	imull	$156, %eax, %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jle	L19
	movl	-28(%ebp), %eax
	imull	$156, %eax, %edx
	movl	8(%ebp), %eax
	addl	%eax, %edx
	leal	-188(%ebp), %eax
	movl	%edx, %ebx
	movl	$39, %edx
	movl	%eax, %edi
	movl	%ebx, %esi
	movl	%edx, %ecx
	rep movsl
	movl	-28(%ebp), %eax
	imull	$156, %eax, %edx
	movl	8(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	-32(%ebp), %eax
	imull	$156, %eax, %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	%ecx, %edx
	movl	%eax, %ebx
	movl	$39, %eax
	movl	%edx, %edi
	movl	%ebx, %esi
	movl	%eax, %ecx
	rep movsl
	movl	-32(%ebp), %eax
	imull	$156, %eax, %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, %ebx
	leal	-188(%ebp), %eax
	movl	$39, %edx
	movl	%ebx, %edi
	movl	%eax, %esi
	movl	%edx, %ecx
	rep movsl
L19:
	addl	$1, -32(%ebp)
L18:
	movl	-32(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	L20
	addl	$1, -28(%ebp)
L17:
	movl	12(%ebp), %eax
	subl	$1, %eax
	cmpl	-28(%ebp), %eax
	jg	L21
	nop
	addl	$204, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE20:
	.section .rdata,"dr"
	.align 4
LC10:
	.ascii "Enter the title of the book to borrow: \0"
	.align 4
LC11:
	.ascii "Sorry, the book is already borrowed.\0"
LC12:
	.ascii "Book '%s' has been borrowed.\12\0"
	.text
	.globl	_borrowBook
	.def	_borrowBook;	.scl	2;	.type	32;	.endef
_borrowBook:
LFB21:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$136, %esp
	movl	$LC10, (%esp)
	call	_printf
	leal	-116(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_scanf
	movl	$0, -12(%ebp)
	movl	$0, -16(%ebp)
	jmp	L23
L28:
	movl	-16(%ebp), %eax
	imull	$156, %eax, %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, %edx
	leal	-116(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L24
	movl	-16(%ebp), %eax
	imull	$156, %eax, %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	152(%eax), %eax
	testl	%eax, %eax
	je	L25
	movl	$LC11, (%esp)
	call	_puts
	jmp	L26
L25:
	movl	-16(%ebp), %eax
	imull	$156, %eax, %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	$1, 152(%eax)
	leal	-116(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC12, (%esp)
	call	_printf
L26:
	movl	$1, -12(%ebp)
	jmp	L27
L24:
	addl	$1, -16(%ebp)
L23:
	movl	-16(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	L28
L27:
	cmpl	$0, -12(%ebp)
	jne	L30
	movl	$LC7, (%esp)
	call	_puts
L30:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE21:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC13:
	.ascii "\12Library Management System\0"
LC14:
	.ascii "1. Add a book\0"
LC15:
	.ascii "2. Search for a book\0"
LC16:
	.ascii "3. Display all books\0"
LC17:
	.ascii "4. Sort books by title\0"
LC18:
	.ascii "5. Borrow a book\0"
LC19:
	.ascii "0. Exit\0"
LC20:
	.ascii "Enter your choice: \0"
LC21:
	.ascii "%d\0"
LC22:
	.ascii "Books sorted by title.\0"
LC23:
	.ascii "Exiting the program.\0"
	.align 4
LC24:
	.ascii "Invalid choice. Please enter a valid option.\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB22:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	movl	$15632, %eax
	call	___chkstk_ms
	subl	%eax, %esp
	call	___main
	movl	$0, 28(%esp)
L41:
	movl	$LC13, (%esp)
	call	_puts
	movl	$LC14, (%esp)
	call	_puts
	movl	$LC15, (%esp)
	call	_puts
	movl	$LC16, (%esp)
	call	_puts
	movl	$LC17, (%esp)
	call	_puts
	movl	$LC18, (%esp)
	call	_puts
	movl	$LC19, (%esp)
	call	_puts
	movl	$LC20, (%esp)
	call	_printf
	leal	24(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC21, (%esp)
	call	_scanf
	movl	24(%esp), %eax
	cmpl	$5, %eax
	ja	L32
	movl	L34(,%eax,4), %eax
	jmp	*%eax
	.section .rdata,"dr"
	.align 4
L34:
	.long	L33
	.long	L35
	.long	L36
	.long	L37
	.long	L38
	.long	L39
	.text
L35:
	leal	28(%esp), %eax
	movl	%eax, 4(%esp)
	leal	32(%esp), %eax
	movl	%eax, (%esp)
	call	_addBook
	jmp	L40
L36:
	movl	28(%esp), %eax
	movl	%eax, 4(%esp)
	leal	32(%esp), %eax
	movl	%eax, (%esp)
	call	_searchBook
	jmp	L40
L37:
	movl	28(%esp), %eax
	movl	%eax, 4(%esp)
	leal	32(%esp), %eax
	movl	%eax, (%esp)
	call	_displayBooks
	jmp	L40
L38:
	movl	28(%esp), %eax
	movl	%eax, 4(%esp)
	leal	32(%esp), %eax
	movl	%eax, (%esp)
	call	_sortBooks
	movl	$LC22, (%esp)
	call	_puts
	jmp	L40
L39:
	movl	28(%esp), %eax
	movl	%eax, 4(%esp)
	leal	32(%esp), %eax
	movl	%eax, (%esp)
	call	_borrowBook
	jmp	L40
L33:
	movl	$LC23, (%esp)
	call	_puts
	jmp	L40
L32:
	movl	$LC24, (%esp)
	call	_puts
L40:
	movl	24(%esp), %eax
	testl	%eax, %eax
	jne	L41
	call	_getch
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE22:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
	.def	_strcmp;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_getch;	.scl	2;	.type	32;	.endef
