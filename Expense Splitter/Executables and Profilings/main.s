	.file	"main.c"
	.section .rdata,"dr"
LC0:
	.ascii "Enter the name of the payer: \0"
LC1:
	.ascii "%s\0"
	.align 4
LC2:
	.ascii "Enter the number of participants: \0"
LC3:
	.ascii "%d\0"
	.align 4
LC4:
	.ascii "Enter the names of participants (one at a time):\0"
LC5:
	.ascii "Participant %d: \0"
	.text
	.globl	_addExpense
	.def	_addExpense;	.scl	2;	.type	32;	.endef
_addExpense:
LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$620, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movl	16(%ebp), %eax
	movl	%eax, -608(%ebp)
	movl	20(%ebp), %eax
	movl	%eax, -604(%ebp)
	movl	$LC0, (%esp)
	call	_printf
	leal	-600(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_scanf
	movl	$0, -28(%ebp)
	jmp	L2
L3:
	movl	-28(%ebp), %eax
	imull	$50, %eax, %eax
	leal	-24(%ebp), %ebx
	addl	%ebx, %eax
	subl	$512, %eax
	movb	$0, (%eax)
	addl	$1, -28(%ebp)
L2:
	movl	8(%ebp), %eax
	movl	640(%eax), %eax
	cmpl	-28(%ebp), %eax
	jg	L3
	fldl	-608(%ebp)
	fstpl	-544(%ebp)
	movl	$LC2, (%esp)
	call	_printf
	leal	-600(%ebp), %eax
	addl	$564, %eax
	movl	%eax, 4(%esp)
	movl	$LC3, (%esp)
	call	_scanf
	movl	$LC4, (%esp)
	call	_puts
	movl	$0, -28(%ebp)
	jmp	L4
L5:
	movl	-28(%ebp), %eax
	addl	$1, %eax
	movl	%eax, 4(%esp)
	movl	$LC5, (%esp)
	call	_printf
	leal	-600(%ebp), %eax
	movl	-28(%ebp), %edx
	imull	$50, %edx, %edx
	addl	$64, %edx
	addl	%edx, %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_scanf
	addl	$1, -28(%ebp)
L4:
	movl	-36(%ebp), %eax
	cmpl	-28(%ebp), %eax
	jg	L5
	movl	$0, -28(%ebp)
	jmp	L6
L9:
	movl	-28(%ebp), %eax
	sall	$6, %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, 4(%esp)
	leal	-600(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L7
	movl	8(%ebp), %eax
	movl	-28(%ebp), %edx
	sall	$6, %edx
	addl	%edx, %eax
	addl	$56, %eax
	fldl	(%eax)
	fldl	-544(%ebp)
	faddp	%st, %st(1)
	movl	8(%ebp), %eax
	movl	-28(%ebp), %edx
	sall	$6, %edx
	addl	%edx, %eax
	addl	$56, %eax
	fstpl	(%eax)
	jmp	L8
L7:
	addl	$1, -28(%ebp)
L6:
	movl	8(%ebp), %eax
	movl	640(%eax), %eax
	cmpl	-28(%ebp), %eax
	jg	L9
L8:
	movl	12(%ebp), %eax
	movl	56800(%eax), %eax
	leal	1(%eax), %ecx
	movl	12(%ebp), %edx
	movl	%ecx, 56800(%edx)
	movl	12(%ebp), %edx
	imull	$568, %eax, %eax
	addl	%edx, %eax
	movl	%eax, %ebx
	leal	-600(%ebp), %eax
	movl	$142, %edx
	movl	%ebx, %edi
	movl	%eax, %esi
	movl	%edx, %ecx
	rep movsl
	nop
	addl	$620, %esp
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
LFE17:
	.section .rdata,"dr"
LC7:
	.ascii "\12Expense Summary:\0"
LC8:
	.ascii "%s owes %.2f\12\0"
	.text
	.globl	_displayBalances
	.def	_displayBalances;	.scl	2;	.type	32;	.endef
_displayBalances:
LFB18:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$LC7, (%esp)
	call	_puts
	movl	$0, -12(%ebp)
	jmp	L11
L12:
	movl	8(%ebp), %eax
	movl	-12(%ebp), %edx
	sall	$6, %edx
	addl	%edx, %eax
	addl	$56, %eax
	fldl	(%eax)
	movl	-12(%ebp), %eax
	sall	$6, %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	fstpl	8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC8, (%esp)
	call	_printf
	addl	$1, -12(%ebp)
L11:
	movl	8(%ebp), %eax
	movl	640(%eax), %eax
	cmpl	-12(%ebp), %eax
	jg	L12
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.section .rdata,"dr"
LC9:
	.ascii "\12Expense Details:\0"
	.align 4
LC10:
	.ascii "Payer: %s | Amount: %.2f | Participants: \0"
LC11:
	.ascii "%s \0"
	.text
	.globl	_displayExpenses
	.def	_displayExpenses;	.scl	2;	.type	32;	.endef
_displayExpenses:
LFB19:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$LC9, (%esp)
	call	_puts
	movl	$0, -12(%ebp)
	jmp	L14
L17:
	movl	8(%ebp), %edx
	movl	-12(%ebp), %eax
	imull	$568, %eax, %eax
	addl	%edx, %eax
	addl	$56, %eax
	fldl	(%eax)
	movl	-12(%ebp), %eax
	imull	$568, %eax, %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	fstpl	8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC10, (%esp)
	call	_printf
	movl	$0, -16(%ebp)
	jmp	L15
L16:
	movl	-16(%ebp), %eax
	imull	$50, %eax, %edx
	movl	-12(%ebp), %eax
	imull	$568, %eax, %eax
	addl	%edx, %eax
	leal	64(%eax), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, 4(%esp)
	movl	$LC11, (%esp)
	call	_printf
	addl	$1, -16(%ebp)
L15:
	movl	8(%ebp), %edx
	movl	-12(%ebp), %eax
	imull	$568, %eax, %eax
	addl	%edx, %eax
	addl	$564, %eax
	movl	(%eax), %eax
	cmpl	-16(%ebp), %eax
	jg	L16
	movl	$10, (%esp)
	call	_putchar
	addl	$1, -12(%ebp)
L14:
	movl	8(%ebp), %eax
	movl	56800(%eax), %eax
	cmpl	-12(%ebp), %eax
	jg	L17
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
LC12:
	.ascii "Enter the number of users (up to %d): \0"
	.align 4
LC13:
	.ascii "Invalid number of users. Exiting.\0"
LC14:
	.ascii "Enter name of user %d: \0"
LC16:
	.ascii "\12Enter an expense: \0"
LC17:
	.ascii "%lf\0"
	.align 4
LC18:
	.ascii "\12Do you want to add another expense? (y/n): \0"
LC19:
	.ascii " %c\0"
	.align 4
LC20:
	.ascii "\12Exiting the expense-splitting app. Thank you!\0"
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
	movl	$57504, %eax
	call	___chkstk_ms
	subl	%eax, %esp
	call	___main
	movl	$0, 57488(%esp)
	movl	$0, 56840(%esp)
	movl	$10, 4(%esp)
	movl	$LC12, (%esp)
	call	_printf
	leal	56848(%esp), %eax
	addl	$640, %eax
	movl	%eax, 4(%esp)
	movl	$LC3, (%esp)
	call	_scanf
	movl	57488(%esp), %eax
	cmpl	$10, %eax
	jg	L19
	movl	57488(%esp), %eax
	testl	%eax, %eax
	jg	L20
L19:
	movl	$LC13, (%esp)
	call	_puts
	movl	$1, %eax
	jmp	L25
L20:
	movl	$0, 57500(%esp)
	jmp	L22
L23:
	movl	57500(%esp), %eax
	addl	$1, %eax
	movl	%eax, 4(%esp)
	movl	$LC14, (%esp)
	call	_printf
	leal	56848(%esp), %eax
	movl	57500(%esp), %edx
	sall	$6, %edx
	addl	%edx, %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_scanf
	movl	57500(%esp), %eax
	sall	$6, %eax
	leal	57504(%esp), %ecx
	addl	%ecx, %eax
	subl	$600, %eax
	fldz
	fstpl	(%eax)
	addl	$1, 57500(%esp)
L22:
	movl	57488(%esp), %eax
	cmpl	57500(%esp), %eax
	jg	L23
L24:
	movl	$LC16, (%esp)
	call	_printf
	leal	24(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC17, (%esp)
	call	_scanf
	fldl	24(%esp)
	fstpl	8(%esp)
	leal	40(%esp), %eax
	movl	%eax, 4(%esp)
	leal	56848(%esp), %eax
	movl	%eax, (%esp)
	call	_addExpense
	leal	56848(%esp), %eax
	movl	%eax, (%esp)
	call	_displayBalances
	leal	40(%esp), %eax
	movl	%eax, (%esp)
	call	_displayExpenses
	movl	$LC18, (%esp)
	call	_printf
	leal	39(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC19, (%esp)
	call	_scanf
	movzbl	39(%esp), %eax
	cmpb	$121, %al
	je	L24
	movzbl	39(%esp), %eax
	cmpb	$89, %al
	je	L24
	movl	$LC20, (%esp)
	call	_puts
	call	_getch
	movl	$0, %eax
L25:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE20:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_strcmp;	.scl	2;	.type	32;	.endef
	.def	_putchar;	.scl	2;	.type	32;	.endef
	.def	_getch;	.scl	2;	.type	32;	.endef
