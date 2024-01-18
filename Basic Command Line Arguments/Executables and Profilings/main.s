	.file	"main.c"
	.section .rdata,"dr"
	.align 4
LC0:
	.ascii "Usage: program_name [options] filename\0"
LC1:
	.ascii "Options:\0"
	.align 4
LC2:
	.ascii "  -h, --help     Display this help message\0"
	.align 4
LC3:
	.ascii "  -c, --count    Count the number of lines in the file\0"
	.align 4
LC4:
	.ascii "  -r, --read     Read and display the content of the file\0"
	.text
	.globl	_printHelp
	.def	_printHelp;	.scl	2;	.type	32;	.endef
_printHelp:
LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	$LC0, (%esp)
	call	_puts
	movl	$LC1, (%esp)
	call	_puts
	movl	$LC2, (%esp)
	call	_puts
	movl	$LC3, (%esp)
	call	_puts
	movl	$LC4, (%esp)
	call	_puts
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE17:
	.section .rdata,"dr"
LC5:
	.ascii "r\0"
LC6:
	.ascii "Error opening file\0"
	.text
	.globl	_countLines
	.def	_countLines;	.scl	2;	.type	32;	.endef
_countLines:
LFB18:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$LC5, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_fopen
	movl	%eax, -16(%ebp)
	cmpl	$0, -16(%ebp)
	jne	L3
	movl	$LC6, (%esp)
	call	_perror
	movl	$1, (%esp)
	call	_exit
L3:
	movl	$0, -12(%ebp)
	jmp	L4
L5:
	cmpb	$10, -17(%ebp)
	jne	L4
	addl	$1, -12(%ebp)
L4:
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fgetc
	movb	%al, -17(%ebp)
	cmpb	$-1, -17(%ebp)
	jne	L5
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.section .rdata,"dr"
LC7:
	.ascii "Content of %s:\12\0"
	.text
	.globl	_readFile
	.def	_readFile;	.scl	2;	.type	32;	.endef
_readFile:
LFB19:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$LC5, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_fopen
	movl	%eax, -12(%ebp)
	cmpl	$0, -12(%ebp)
	jne	L8
	movl	$LC6, (%esp)
	call	_perror
	movl	$1, (%esp)
	call	_exit
L8:
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC7, (%esp)
	call	_printf
	jmp	L9
L10:
	movsbl	-13(%ebp), %eax
	movl	%eax, (%esp)
	call	_putchar
L9:
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_fgetc
	movb	%al, -13(%ebp)
	cmpb	$-1, -13(%ebp)
	jne	L10
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
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
	.ascii "Error: Insufficient arguments.\0"
LC9:
	.ascii "--help\0"
LC10:
	.ascii "--count\0"
LC11:
	.ascii "Number of lines in %s: %d\12\0"
	.align 4
LC12:
	.ascii "Error: Missing filename for option -c/--count\0"
LC13:
	.ascii "--read\0"
	.align 4
LC14:
	.ascii "Error: Missing filename for option -r/--read\0"
LC15:
	.ascii "Error: Unknown option %s\12\0"
	.align 4
LC16:
	.ascii "Error: Multiple filenames provided.\0"
LC17:
	.ascii "Error: No filename provided.\0"
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
	cmpl	$1, 8(%ebp)
	jg	L12
	movl	$LC8, (%esp)
	call	_puts
	call	_printHelp
	movl	$1, %eax
	jmp	L13
L12:
	movl	$0, 28(%esp)
	movl	$1, 24(%esp)
	jmp	L14
L27:
	movl	24(%esp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movzbl	(%eax), %eax
	cmpb	$45, %al
	jne	L15
	movl	24(%esp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	addl	$1, %eax
	movzbl	(%eax), %eax
	cmpb	$104, %al
	je	L16
	movl	24(%esp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	$LC9, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L17
L16:
	call	_printHelp
	movl	$0, %eax
	jmp	L13
L17:
	movl	24(%esp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	addl	$1, %eax
	movzbl	(%eax), %eax
	cmpb	$99, %al
	je	L18
	movl	24(%esp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	$LC10, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L19
L18:
	cmpl	$0, 28(%esp)
	jne	L20
	movl	24(%esp), %eax
	addl	$1, %eax
	cmpl	8(%ebp), %eax
	jge	L20
	addl	$1, 24(%esp)
	movl	24(%esp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	%eax, 28(%esp)
	movl	28(%esp), %eax
	movl	%eax, (%esp)
	call	_countLines
	movl	%eax, 8(%esp)
	movl	28(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC11, (%esp)
	call	_printf
	jmp	L25
L20:
	movl	$LC12, (%esp)
	call	_puts
	call	_printHelp
	movl	$1, %eax
	jmp	L13
L19:
	movl	24(%esp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	addl	$1, %eax
	movzbl	(%eax), %eax
	cmpb	$114, %al
	je	L22
	movl	24(%esp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	$LC13, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L23
L22:
	cmpl	$0, 28(%esp)
	jne	L24
	movl	24(%esp), %eax
	addl	$1, %eax
	cmpl	8(%ebp), %eax
	jge	L24
	addl	$1, 24(%esp)
	movl	24(%esp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	%eax, 28(%esp)
	movl	28(%esp), %eax
	movl	%eax, (%esp)
	call	_readFile
	jmp	L25
L24:
	movl	$LC14, (%esp)
	call	_puts
	call	_printHelp
	movl	$1, %eax
	jmp	L13
L23:
	movl	24(%esp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC15, (%esp)
	call	_printf
	call	_printHelp
	movl	$1, %eax
	jmp	L13
L15:
	cmpl	$0, 28(%esp)
	jne	L26
	movl	24(%esp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	%eax, 28(%esp)
	jmp	L25
L26:
	movl	$LC16, (%esp)
	call	_puts
	call	_printHelp
	movl	$1, %eax
	jmp	L13
L25:
	addl	$1, 24(%esp)
L14:
	movl	24(%esp), %eax
	cmpl	8(%ebp), %eax
	jl	L27
	cmpl	$0, 28(%esp)
	jne	L28
	movl	$LC17, (%esp)
	call	_puts
	call	_printHelp
	movl	$1, %eax
	jmp	L13
L28:
	call	_getch
	movl	$0, %eax
L13:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE20:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_fopen;	.scl	2;	.type	32;	.endef
	.def	_perror;	.scl	2;	.type	32;	.endef
	.def	_exit;	.scl	2;	.type	32;	.endef
	.def	_fgetc;	.scl	2;	.type	32;	.endef
	.def	_fclose;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_putchar;	.scl	2;	.type	32;	.endef
	.def	_strcmp;	.scl	2;	.type	32;	.endef
	.def	_getch;	.scl	2;	.type	32;	.endef
