	.file	"server.c"
	.text
	.globl	error
	.type	error, @function
error:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE6:
	.size	error, .-error
	.section	.rodata
	.align 8
.LC0:
	.string	"Bandwidth: %d KB/s\nConnected Devices: %d\nNetwork Statistics: ...\n"
	.text
	.globl	monitor_network
	.type	monitor_network, @function
monitor_network:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$1048, %rsp
	.cfi_offset 3, -24
	movl	%edi, -1044(%rbp)
.L3:
	call	rand@PLT
	movl	%eax, %edx
	movslq	%edx, %rax
	imulq	$1717986919, %rax, %rax
	shrq	$32, %rax
	movl	%eax, %ecx
	sarl	$2, %ecx
	movl	%edx, %eax
	sarl	$31, %eax
	movl	%ecx, %ebx
	subl	%eax, %ebx
	movl	%ebx, %eax
	sall	$2, %eax
	addl	%ebx, %eax
	addl	%eax, %eax
	movl	%edx, %ebx
	subl	%eax, %ebx
	call	rand@PLT
	movl	%eax, %edx
	movslq	%edx, %rax
	imulq	$1374389535, %rax, %rax
	shrq	$32, %rax
	sarl	$5, %eax
	movl	%edx, %ecx
	sarl	$31, %ecx
	subl	%ecx, %eax
	imull	$100, %eax, %ecx
	movl	%edx, %eax
	subl	%ecx, %eax
	leaq	-1040(%rbp), %rdi
	movl	%ebx, %r8d
	movl	%eax, %ecx
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdx
	movl	$1024, %esi
	movl	$0, %eax
	call	snprintf@PLT
	leaq	-1040(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	leaq	-1040(%rbp), %rsi
	movl	-1044(%rbp), %eax
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	movl	$1, %edi
	call	sleep@PLT
	nop
	jmp	.L3
	.cfi_endproc
.LFE7:
	.size	monitor_network, .-monitor_network
	.section	.rodata
.LC1:
	.string	"Error creating socket"
.LC2:
	.string	"Error binding socket"
	.align 8
.LC3:
	.string	"Error listening for connections"
	.align 8
.LC4:
	.string	"Server is listening on port %d...\n"
.LC5:
	.string	"Error accepting connection"
.LC6:
	.string	"Client connected"
	.text
	.globl	main
	.type	main, @function
main:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movl	%edi, -68(%rbp)
	movq	%rsi, -80(%rbp)
	movl	$16, -52(%rbp)
	movl	$0, %edx
	movl	$1, %esi
	movl	$2, %edi
	call	socket@PLT
	movl	%eax, -4(%rbp)
	cmpl	$-1, -4(%rbp)
	jne	.L5
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	error
.L5:
	leaq	-32(%rbp), %rax
	movl	$16, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movw	$2, -32(%rbp)
	movl	$0, -28(%rbp)
	movl	$8888, %edi
	call	htons@PLT
	movw	%ax, -30(%rbp)
	leaq	-32(%rbp), %rcx
	movl	-4(%rbp), %eax
	movl	$16, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	bind@PLT
	cmpl	$-1, %eax
	jne	.L6
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	error
.L6:
	movl	-4(%rbp), %eax
	movl	$5, %esi
	movl	%eax, %edi
	call	listen@PLT
	cmpl	$-1, %eax
	jne	.L7
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	error
.L7:
	movl	$8888, %esi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L10:
	leaq	-52(%rbp), %rdx
	leaq	-48(%rbp), %rcx
	movl	-4(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	accept@PLT
	movl	%eax, -8(%rbp)
	cmpl	$-1, -8(%rbp)
	jne	.L8
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	call	error
.L8:
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	call	fork@PLT
	testl	%eax, %eax
	jne	.L9
	movl	-4(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	-8(%rbp), %eax
	movl	%eax, %edi
	call	monitor_network
	movl	-8(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$0, %edi
	call	exit@PLT
.L9:
	movl	-8(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	jmp	.L10
	.cfi_endproc
.LFE8:
	.size	main, .-main
	.ident	"GCC: (Debian 13.2.0-7) 13.2.0"
	.section	.note.GNU-stack,"",@progbits
