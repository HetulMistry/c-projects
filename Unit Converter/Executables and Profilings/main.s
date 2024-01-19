	.file	"main.c"
	.section .rdata,"dr"
LC2:
	.ascii "Invalid unit number\0"
	.text
	.globl	_convertLength
	.def	_convertLength;	.scl	2;	.type	32;	.endef
_convertLength:
LFB10:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	12(%ebp), %eax
	cmpl	16(%ebp), %eax
	jne	L2
	flds	8(%ebp)
	jmp	L3
L2:
	movl	12(%ebp), %eax
	cmpl	$2, %eax
	je	L5
	cmpl	$3, %eax
	je	L16
	cmpl	$1, %eax
	jne	L14
	flds	8(%ebp)
	flds	LC0
	fmulp	%st, %st(1)
	fstps	8(%ebp)
	jmp	L8
L5:
	flds	8(%ebp)
	flds	LC1
	fmulp	%st, %st(1)
	fstps	8(%ebp)
	jmp	L8
L14:
	movl	$LC2, (%esp)
	call	_puts
	fldz
	jmp	L3
L16:
	nop
L8:
	movl	16(%ebp), %eax
	cmpl	$2, %eax
	je	L10
	cmpl	$3, %eax
	je	L17
	cmpl	$1, %eax
	jne	L15
	flds	8(%ebp)
	flds	LC0
	fdivrp	%st, %st(1)
	fstps	8(%ebp)
	jmp	L13
L10:
	flds	8(%ebp)
	flds	LC1
	fdivrp	%st, %st(1)
	fstps	8(%ebp)
	jmp	L13
L15:
	movl	$LC2, (%esp)
	call	_puts
	fldz
	jmp	L3
L17:
	nop
L13:
	flds	8(%ebp)
L3:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE10:
	.globl	_convertWeight
	.def	_convertWeight;	.scl	2;	.type	32;	.endef
_convertWeight:
LFB11:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	12(%ebp), %eax
	cmpl	$2, %eax
	je	L32
	cmpl	$3, %eax
	je	L21
	cmpl	$1, %eax
	jne	L30
	flds	8(%ebp)
	flds	LC0
	fmulp	%st, %st(1)
	fstps	8(%ebp)
	jmp	L23
L21:
	flds	8(%ebp)
	fldl	LC5
	fmulp	%st, %st(1)
	fstps	8(%ebp)
	jmp	L23
L30:
	movl	$LC2, (%esp)
	call	_puts
	fldz
	jmp	L24
L32:
	nop
L23:
	movl	16(%ebp), %eax
	cmpl	$2, %eax
	je	L33
	cmpl	$3, %eax
	je	L27
	cmpl	$1, %eax
	jne	L31
	flds	8(%ebp)
	flds	LC0
	fdivrp	%st, %st(1)
	fstps	8(%ebp)
	jmp	L29
L27:
	flds	8(%ebp)
	fldl	LC5
	fdivrp	%st, %st(1)
	fstps	8(%ebp)
	jmp	L29
L31:
	movl	$LC2, (%esp)
	call	_puts
	fldz
	jmp	L24
L33:
	nop
L29:
	flds	8(%ebp)
L24:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE11:
	.globl	_convertTemperature
	.def	_convertTemperature;	.scl	2;	.type	32;	.endef
_convertTemperature:
LFB12:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	12(%ebp), %eax
	cmpl	$2, %eax
	je	L36
	cmpl	$3, %eax
	je	L37
	cmpl	$1, %eax
	jne	L46
	flds	8(%ebp)
	flds	LC6
	fmulp	%st, %st(1)
	flds	LC7
	fdivrp	%st, %st(1)
	flds	LC8
	faddp	%st, %st(1)
	fstps	8(%ebp)
	jmp	L39
L36:
	flds	8(%ebp)
	flds	LC8
	fsubrp	%st, %st(1)
	flds	LC7
	fmulp	%st, %st(1)
	flds	LC6
	fdivrp	%st, %st(1)
	fstps	8(%ebp)
	jmp	L39
L37:
	flds	8(%ebp)
	fldl	LC9
	fsubrp	%st, %st(1)
	fstps	8(%ebp)
	jmp	L39
L46:
	movl	$LC2, (%esp)
	call	_puts
	fldz
	jmp	L40
L39:
	movl	16(%ebp), %eax
	cmpl	$2, %eax
	je	L42
	cmpl	$3, %eax
	je	L43
	cmpl	$1, %eax
	je	L48
	jmp	L47
L42:
	flds	8(%ebp)
	flds	LC6
	fmulp	%st, %st(1)
	flds	LC7
	fdivrp	%st, %st(1)
	flds	LC8
	faddp	%st, %st(1)
	fstps	8(%ebp)
	jmp	L45
L43:
	flds	8(%ebp)
	fldl	LC9
	faddp	%st, %st(1)
	fstps	8(%ebp)
	jmp	L45
L47:
	movl	$LC2, (%esp)
	call	_puts
	fldz
	jmp	L40
L48:
	nop
L45:
	flds	8(%ebp)
L40:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE12:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC10:
	.ascii "Unit Converter\0"
LC11:
	.ascii "1. Length\0"
LC12:
	.ascii "2. Weight\0"
LC13:
	.ascii "3. Temperature\0"
LC14:
	.ascii "4. QUIT\0"
LC15:
	.ascii "Enter the category number: \0"
LC16:
	.ascii "%d\0"
LC17:
	.ascii "Select units:\0"
LC18:
	.ascii "1. Meters\0"
LC19:
	.ascii "2. Kilometers\0"
LC20:
	.ascii "3. Centimeters\0"
	.align 4
LC21:
	.ascii "Enter the source unit number: \0"
	.align 4
LC22:
	.ascii "Enter the target unit number: \0"
LC23:
	.ascii "Enter the value: \0"
LC24:
	.ascii "%f\0"
LC25:
	.ascii "Result: %f\12\0"
LC26:
	.ascii "1. Kilograms\0"
LC27:
	.ascii "2. Grams\0"
LC28:
	.ascii "3. Pounds\0"
LC29:
	.ascii "1. Celsius\0"
LC30:
	.ascii "2. Fahrenheit\0"
LC31:
	.ascii "3. Kelvin\0"
LC32:
	.ascii "Invalid category number\0"
	.align 4
LC33:
	.ascii "Enter any key to exit the program.\0"
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
	subl	$96, %esp
	call	___main
L59:
	movl	$LC10, (%esp)
	call	_puts
	movl	$LC11, (%esp)
	call	_puts
	movl	$LC12, (%esp)
	call	_puts
	movl	$LC13, (%esp)
	call	_puts
	movl	$LC14, (%esp)
	call	_puts
	movl	$LC15, (%esp)
	call	_printf
	leal	80(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC16, (%esp)
	call	_scanf
	movl	80(%esp), %eax
	cmpl	$2, %eax
	je	L51
	cmpl	$2, %eax
	jg	L52
	cmpl	$1, %eax
	je	L53
	jmp	L50
L52:
	cmpl	$3, %eax
	je	L54
	cmpl	$4, %eax
	je	L61
	jmp	L50
L53:
	movl	$LC17, (%esp)
	call	_puts
	movl	$LC18, (%esp)
	call	_puts
	movl	$LC19, (%esp)
	call	_puts
	movl	$LC20, (%esp)
	call	_puts
	movl	$LC21, (%esp)
	call	_printf
	leal	76(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC16, (%esp)
	call	_scanf
	movl	$LC22, (%esp)
	call	_printf
	leal	72(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC16, (%esp)
	call	_scanf
	movl	$LC23, (%esp)
	call	_printf
	leal	68(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC24, (%esp)
	call	_scanf
	movl	72(%esp), %edx
	movl	76(%esp), %eax
	flds	68(%esp)
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	fstps	(%esp)
	call	_convertLength
	fstps	28(%esp)
	movl	28(%esp), %eax
	movl	%eax, 92(%esp)
	flds	92(%esp)
	fstpl	4(%esp)
	movl	$LC25, (%esp)
	call	_printf
	jmp	L58
L51:
	movl	$LC17, (%esp)
	call	_puts
	movl	$LC26, (%esp)
	call	_puts
	movl	$LC27, (%esp)
	call	_puts
	movl	$LC28, (%esp)
	call	_puts
	movl	$LC21, (%esp)
	call	_printf
	leal	64(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC16, (%esp)
	call	_scanf
	movl	$LC22, (%esp)
	call	_printf
	leal	60(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC16, (%esp)
	call	_scanf
	movl	$LC23, (%esp)
	call	_printf
	leal	56(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC24, (%esp)
	call	_scanf
	movl	60(%esp), %edx
	movl	64(%esp), %eax
	flds	56(%esp)
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	fstps	(%esp)
	call	_convertWeight
	fstps	28(%esp)
	movl	28(%esp), %eax
	movl	%eax, 88(%esp)
	flds	88(%esp)
	fstpl	4(%esp)
	movl	$LC25, (%esp)
	call	_printf
	jmp	L58
L54:
	movl	$LC17, (%esp)
	call	_puts
	movl	$LC29, (%esp)
	call	_puts
	movl	$LC30, (%esp)
	call	_puts
	movl	$LC31, (%esp)
	call	_puts
	movl	$LC21, (%esp)
	call	_printf
	leal	52(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC16, (%esp)
	call	_scanf
	movl	$LC22, (%esp)
	call	_printf
	leal	48(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC16, (%esp)
	call	_scanf
	movl	$LC23, (%esp)
	call	_printf
	leal	44(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC24, (%esp)
	call	_scanf
	movl	48(%esp), %edx
	movl	52(%esp), %eax
	flds	44(%esp)
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	fstps	(%esp)
	call	_convertTemperature
	fstps	28(%esp)
	movl	28(%esp), %eax
	movl	%eax, 84(%esp)
	flds	84(%esp)
	fstpl	4(%esp)
	movl	$LC25, (%esp)
	call	_printf
	jmp	L58
L50:
	movl	$LC32, (%esp)
	call	_puts
L58:
	jmp	L59
L61:
	nop
L57:
	movl	$LC33, (%esp)
	call	_printf
	call	_getch
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE13:
	.section .rdata,"dr"
	.align 4
LC0:
	.long	1148846080
	.align 4
LC1:
	.long	1232348160
	.align 8
LC5:
	.long	-721554506
	.long	1081891192
	.align 4
LC6:
	.long	1091567616
	.align 4
LC7:
	.long	1084227584
	.align 4
LC8:
	.long	1107296256
	.align 8
LC9:
	.long	1717986918
	.long	1081152102
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
	.def	_getch;	.scl	2;	.type	32;	.endef
