	.file	"main.c"
	.text
	.globl	_reverseString
	.def	_reverseString;	.scl	2;	.type	32;	.endef
_reverseString:
LFB13:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_strlen
	movl	%eax, -16(%ebp)
	movl	$0, -12(%ebp)
	jmp	L2
L3:
	movl	-12(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movb	%al, -17(%ebp)
	movl	-12(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%eax, %edx
	movl	-16(%ebp), %eax
	subl	-12(%ebp), %eax
	leal	-1(%eax), %ecx
	movl	8(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	-16(%ebp), %eax
	subl	-12(%ebp), %eax
	leal	-1(%eax), %edx
	movl	8(%ebp), %eax
	addl	%eax, %edx
	movzbl	-17(%ebp), %eax
	movb	%al, (%edx)
	addl	$1, -12(%ebp)
L2:
	movl	-16(%ebp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	cmpl	-12(%ebp), %eax
	jg	L3
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE13:
	.globl	_isPalindrome
	.def	_isPalindrome;	.scl	2;	.type	32;	.endef
_isPalindrome:
LFB14:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_strlen
	movl	%eax, -16(%ebp)
	movl	$0, -12(%ebp)
	jmp	L5
L8:
	movl	-12(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %edx
	movl	-16(%ebp), %eax
	subl	-12(%ebp), %eax
	leal	-1(%eax), %ecx
	movl	8(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	cmpb	%al, %dl
	je	L6
	movl	$0, %eax
	jmp	L7
L6:
	addl	$1, -12(%ebp)
L5:
	movl	-16(%ebp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	cmpl	-12(%ebp), %eax
	jg	L8
	movl	$1, %eax
L7:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE14:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC0:
	.ascii "Enter a string: \0"
LC1:
	.ascii "\12\0"
LC2:
	.ascii "Original String: %s\12\0"
LC3:
	.ascii "Reversed String: %s\12\0"
LC4:
	.ascii "The string is a palindrome.\0"
	.align 4
LC5:
	.ascii "The string is not a palindrome.\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB15:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	addl	$-128, %esp
	call	___main
	movl	$LC0, (%esp)
	call	_printf
	movl	__imp___iob, %eax
	movl	%eax, 8(%esp)
	movl	$100, 4(%esp)
	leal	28(%esp), %eax
	movl	%eax, (%esp)
	call	_fgets
	movl	$LC1, 4(%esp)
	leal	28(%esp), %eax
	movl	%eax, (%esp)
	call	_strcspn
	movb	$0, 28(%esp,%eax)
	leal	28(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_printf
	leal	28(%esp), %eax
	movl	%eax, (%esp)
	call	_reverseString
	leal	28(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC3, (%esp)
	call	_printf
	leal	28(%esp), %eax
	movl	%eax, (%esp)
	call	_isPalindrome
	testl	%eax, %eax
	je	L10
	movl	$LC4, (%esp)
	call	_puts
	jmp	L11
L10:
	movl	$LC5, (%esp)
	call	_puts
L11:
	call	_getch
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE15:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_strlen;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_fgets;	.scl	2;	.type	32;	.endef
	.def	_strcspn;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_getch;	.scl	2;	.type	32;	.endef
