	.file	"server.c"
	.text
	.section	.rodata
.LC0:
	.string	"Error creating socket"
.LC1:
	.string	"Error binding socket"
	.align 8
.LC2:
	.string	"Error listening for connections"
	.align 8
.LC3:
	.string	"Server listening on port %d...\n"
.LC4:
	.string	"Error accepting connection"
.LC5:
	.string	"Client connected: %s\n"
.LC6:
	.string	"Error receiving data"
.LC7:
	.string	"Received from client: %s"
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
	subq	$1104, %rsp
	movl	%edi, -1092(%rbp)
	movq	%rsi, -1104(%rbp)
	movl	$16, -52(%rbp)
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
	movl	$0, -28(%rbp)
	leaq	-32(%rbp), %rcx
	movl	-4(%rbp), %eax
	movl	$16, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	bind@PLT
	cmpl	$-1, %eax
	jne	.L3
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
.L3:
	movl	-4(%rbp), %eax
	movl	$10, %esi
	movl	%eax, %edi
	call	listen@PLT
	cmpl	$-1, %eax
	jne	.L4
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
.L4:
	movl	$12345, %esi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-52(%rbp), %rdx
	leaq	-48(%rbp), %rcx
	movl	-4(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	accept@PLT
	movl	%eax, -8(%rbp)
	cmpl	$-1, -8(%rbp)
	jne	.L5
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
.L5:
	movl	-44(%rbp), %eax
	movl	%eax, %edi
	call	inet_ntoa@PLT
	movq	%rax, %rsi
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L8:
	leaq	-1088(%rbp), %rsi
	movl	-8(%rbp), %eax
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
	jmp	.L10
.L6:
	leaq	-1088(%rbp), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	leaq	-1088(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-16(%rbp), %rdx
	leaq	-1088(%rbp), %rsi
	movl	-8(%rbp), %eax
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	jmp	.L8
.L10:
	movl	-8(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
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
