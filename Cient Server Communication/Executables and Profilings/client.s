	.file	"client.c"
	.text
	.section	.rodata
.LC0:
	.string	"Error creating socket"
.LC1:
	.string	"127.0.0.1"
.LC2:
	.string	"Error connecting to server"
.LC3:
	.string	"Connected to server"
	.align 8
.LC4:
	.string	"Enter a message to send to the server (or type 'exit' to quit): "
.LC5:
	.string	"exit"
	.align 8
.LC6:
	.string	"Error receiving data from server"
.LC7:
	.string	"Server says: %s"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$1072, %rsp
	movl	%edi, -1060(%rbp)
	movq	%rsi, -1072(%rbp)
	movl	$0, %edx
	movl	$1, %esi
	movl	$2, %edi
	call	socket@PLT
	movl	%eax, -4(%rbp)
	cmpl	$-1, -4(%rbp)
	jne	.L2
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
.L2:
	leaq	-32(%rbp), %rax
	movl	$16, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movw	$2, -32(%rbp)
	movl	$12345, %edi
	call	htons@PLT
	movw	%ax, -30(%rbp)
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	inet_addr@PLT
	movl	%eax, -28(%rbp)
	leaq	-32(%rbp), %rcx
	movl	-4(%rbp), %eax
	movl	$16, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	connect@PLT
	cmpl	$-1, %eax
	jne	.L3
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
.L3:
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L7:
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	stdin(%rip), %rdx
	leaq	-1056(%rbp), %rax
	movl	$1024, %esi
	movq	%rax, %rdi
	call	fgets@PLT
	leaq	-1056(%rbp), %rax
	movl	$4, %edx
	leaq	.LC5(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	testl	%eax, %eax
	je	.L9
	leaq	-1056(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	leaq	-1056(%rbp), %rsi
	movl	-4(%rbp), %eax
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	leaq	-1056(%rbp), %rsi
	movl	-4(%rbp), %eax
	movl	$0, %ecx
	movl	$1024, %edx
	movl	%eax, %edi
	call	recv@PLT
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jg	.L6
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	jmp	.L5
.L6:
	leaq	-1056(%rbp), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	leaq	-1056(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L7
.L9:
	nop
.L5:
	movl	-4(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.ident	"GCC: (Debian 13.2.0-7) 13.2.0"
	.section	.note.GNU-stack,"",@progbits
