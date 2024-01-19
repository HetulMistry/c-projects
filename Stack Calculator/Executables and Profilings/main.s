	.file	"main.c"
	.text
	.globl	_initialize
	.def	_initialize;	.scl	2;	.type	32;	.endef
_initialize:
LFB15:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	8(%ebp), %eax
	movl	$-1, 400(%eax)
	nop
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE15:
	.globl	_isEmpty
	.def	_isEmpty;	.scl	2;	.type	32;	.endef
_isEmpty:
LFB16:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	8(%ebp), %eax
	movl	400(%eax), %eax
	cmpl	$-1, %eax
	sete	%al
	movzbl	%al, %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE16:
	.globl	_isFull
	.def	_isFull;	.scl	2;	.type	32;	.endef
_isFull:
LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	8(%ebp), %eax
	movl	400(%eax), %eax
	cmpl	$99, %eax
	sete	%al
	movzbl	%al, %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE17:
	.section .rdata,"dr"
LC0:
	.ascii "Stack Overflow\0"
	.text
	.globl	_push
	.def	_push;	.scl	2;	.type	32;	.endef
_push:
LFB18:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_isFull
	testl	%eax, %eax
	je	L7
	movl	$LC0, (%esp)
	call	_puts
	movl	$1, (%esp)
	call	_exit
L7:
	movl	8(%ebp), %eax
	movl	400(%eax), %eax
	leal	1(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 400(%eax)
	movl	8(%ebp), %eax
	movl	400(%eax), %edx
	movl	8(%ebp), %eax
	movl	12(%ebp), %ecx
	movl	%ecx, (%eax,%edx,4)
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.section .rdata,"dr"
LC1:
	.ascii "Stack Underflow\0"
	.text
	.globl	_pop
	.def	_pop;	.scl	2;	.type	32;	.endef
_pop:
LFB19:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_isEmpty
	testl	%eax, %eax
	je	L9
	movl	$LC1, (%esp)
	call	_puts
	movl	$1, (%esp)
	call	_exit
L9:
	movl	8(%ebp), %eax
	movl	400(%eax), %eax
	leal	-1(%eax), %ecx
	movl	8(%ebp), %edx
	movl	%ecx, 400(%edx)
	movl	8(%ebp), %edx
	movl	(%edx,%eax,4), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
	.section .rdata,"dr"
LC2:
	.ascii "Invalid operator: %c\12\0"
	.text
	.globl	_evaluateExpression
	.def	_evaluateExpression;	.scl	2;	.type	32;	.endef
_evaluateExpression:
LFB20:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$440, %esp
	leal	-424(%ebp), %eax
	movl	%eax, (%esp)
	call	_initialize
	movl	$0, -12(%ebp)
	jmp	L12
L21:
	movl	-12(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	subl	$48, %eax
	cmpl	$9, %eax
	ja	L13
	movl	-12(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	subl	$48, %eax
	movl	%eax, 4(%esp)
	leal	-424(%ebp), %eax
	movl	%eax, (%esp)
	call	_push
	jmp	L14
L13:
	leal	-424(%ebp), %eax
	movl	%eax, (%esp)
	call	_pop
	movl	%eax, -16(%ebp)
	leal	-424(%ebp), %eax
	movl	%eax, (%esp)
	call	_pop
	movl	%eax, -20(%ebp)
	movl	-12(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	cmpl	$43, %eax
	je	L16
	cmpl	$43, %eax
	jg	L17
	cmpl	$42, %eax
	je	L18
	jmp	L15
L17:
	cmpl	$45, %eax
	je	L19
	cmpl	$47, %eax
	je	L20
	jmp	L15
L16:
	movl	-20(%ebp), %edx
	movl	-16(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, 4(%esp)
	leal	-424(%ebp), %eax
	movl	%eax, (%esp)
	call	_push
	jmp	L14
L19:
	movl	-20(%ebp), %eax
	subl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-424(%ebp), %eax
	movl	%eax, (%esp)
	call	_push
	jmp	L14
L18:
	movl	-20(%ebp), %eax
	imull	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-424(%ebp), %eax
	movl	%eax, (%esp)
	call	_push
	jmp	L14
L20:
	movl	-20(%ebp), %eax
	cltd
	idivl	-16(%ebp)
	movl	%eax, 4(%esp)
	leal	-424(%ebp), %eax
	movl	%eax, (%esp)
	call	_push
	jmp	L14
L15:
	movl	-12(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_printf
	movl	$1, (%esp)
	call	_exit
L14:
	addl	$1, -12(%ebp)
L12:
	movl	-12(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	jne	L21
	leal	-424(%ebp), %eax
	movl	%eax, (%esp)
	call	_pop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE20:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC3:
	.ascii "Enter the expression: \0"
LC4:
	.ascii "Result: %d\12\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB21:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	addl	$-128, %esp
	call	___main
	movl	$LC3, (%esp)
	call	_printf
	movl	__imp___iob, %eax
	movl	%eax, 8(%esp)
	movl	$100, 4(%esp)
	leal	28(%esp), %eax
	movl	%eax, (%esp)
	call	_fgets
	leal	28(%esp), %eax
	movl	%eax, (%esp)
	call	_evaluateExpression
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf
	call	_getch
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE21:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_exit;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_fgets;	.scl	2;	.type	32;	.endef
	.def	_getch;	.scl	2;	.type	32;	.endef
