	.file	"main.c"
	.comm	_flashcards, 10000, 5
	.globl	_totalFlashcards
	.bss
	.align 4
_totalFlashcards:
	.space 4
	.globl	_score
	.align 4
_score:
	.space 4
	.section .rdata,"dr"
LC0:
	.ascii "Enter the native word: \0"
LC1:
	.ascii "%s\0"
	.align 4
LC2:
	.ascii "Enter the foreign translation: \0"
	.align 4
LC3:
	.ascii "Maximum number of flashcards reached.\0"
	.text
	.globl	_addFlashcard
	.def	_addFlashcard;	.scl	2;	.type	32;	.endef
_addFlashcard:
LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$136, %esp
	movl	$LC0, (%esp)
	call	_printf
	leal	-58(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_scanf
	movl	$LC2, (%esp)
	call	_printf
	leal	-108(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_scanf
	movl	_totalFlashcards, %eax
	cmpl	$99, %eax
	jg	L2
	movl	_totalFlashcards, %eax
	imull	$100, %eax, %eax
	leal	_flashcards(%eax), %edx
	leal	-58(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_strcpy
	movl	_totalFlashcards, %eax
	imull	$100, %eax, %eax
	addl	$48, %eax
	addl	$_flashcards, %eax
	leal	2(%eax), %edx
	leal	-108(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_strcpy
	movl	_totalFlashcards, %eax
	addl	$1, %eax
	movl	%eax, _totalFlashcards
	jmp	L4
L2:
	movl	$LC3, (%esp)
	call	_puts
L4:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE17:
	.section .rdata,"dr"
LC4:
	.ascii "Translate: %s\12\0"
LC5:
	.ascii "Your answer: \0"
LC6:
	.ascii "Correct!\0"
	.align 4
LC7:
	.ascii "Incorrect. The correct answer is: %s\12\0"
	.text
	.globl	_displayFlashcard
	.def	_displayFlashcard;	.scl	2;	.type	32;	.endef
_displayFlashcard:
LFB18:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$88, %esp
	movl	8(%ebp), %eax
	imull	$100, %eax, %eax
	addl	$_flashcards, %eax
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf
	movl	$LC5, (%esp)
	call	_printf
	leal	-58(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_scanf
	movl	8(%ebp), %eax
	imull	$100, %eax, %eax
	addl	$48, %eax
	addl	$_flashcards, %eax
	addl	$2, %eax
	movl	%eax, 4(%esp)
	leal	-58(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L6
	movl	$LC6, (%esp)
	call	_puts
	movl	_score, %eax
	addl	$1, %eax
	movl	%eax, _score
	jmp	L8
L6:
	movl	8(%ebp), %eax
	imull	$100, %eax, %eax
	addl	$48, %eax
	addl	$_flashcards, %eax
	addl	$2, %eax
	movl	%eax, 4(%esp)
	movl	$LC7, (%esp)
	call	_printf
L8:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.globl	_practice
	.def	_practice;	.scl	2;	.type	32;	.endef
_practice:
LFB19:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, -12(%ebp)
	jmp	L10
L11:
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_displayFlashcard
	addl	$1, -12(%ebp)
L10:
	movl	_totalFlashcards, %eax
	cmpl	%eax, -12(%ebp)
	jl	L11
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
LC8:
	.ascii "Welcome to the Flashcard Language Learning Tool!\0"
LC9:
	.ascii "\12Options:\0"
LC10:
	.ascii "1. Add Flashcard\0"
LC11:
	.ascii "2. Practice\0"
LC12:
	.ascii "3. View Score\0"
LC13:
	.ascii "4. Exit\0"
LC14:
	.ascii "Enter your choice: \0"
LC15:
	.ascii "%d\0"
LC16:
	.ascii "Your current score: %d/%d\12\0"
LC17:
	.ascii "Exiting the program. Goodbye!\0"
	.align 4
LC18:
	.ascii "Invalid choice. Please try again.\0"
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
	movl	$LC8, (%esp)
	call	_puts
L20:
	movl	$LC9, (%esp)
	call	_puts
	movl	$LC10, (%esp)
	call	_puts
	movl	$LC11, (%esp)
	call	_puts
	movl	$LC12, (%esp)
	call	_puts
	movl	$LC13, (%esp)
	call	_puts
	movl	$LC14, (%esp)
	call	_printf
	leal	28(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC15, (%esp)
	call	_scanf
	movl	28(%esp), %eax
	cmpl	$2, %eax
	je	L14
	cmpl	$2, %eax
	jg	L15
	cmpl	$1, %eax
	je	L16
	jmp	L13
L15:
	cmpl	$3, %eax
	je	L17
	cmpl	$4, %eax
	je	L18
	jmp	L13
L16:
	call	_addFlashcard
	jmp	L19
L14:
	call	_practice
	jmp	L19
L17:
	movl	_totalFlashcards, %edx
	movl	_score, %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC16, (%esp)
	call	_printf
	jmp	L19
L18:
	movl	$LC17, (%esp)
	call	_puts
	movl	$0, (%esp)
	call	_exit
L13:
	movl	$LC18, (%esp)
	call	_puts
L19:
	jmp	L20
	.cfi_endproc
LFE20:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
	.def	_strcpy;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_strcmp;	.scl	2;	.type	32;	.endef
	.def	_exit;	.scl	2;	.type	32;	.endef
