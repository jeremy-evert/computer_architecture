	.file	"08_repository.c"
	.text
	.p2align 4
	.type	transform, @function
transform:
.LFB54:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pxor	%xmm8, %xmm8
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$336, %rsp
	.cfi_def_cfa_offset 368
	movdqu	(%rsi), %xmm2
	movdqu	16(%rsi), %xmm9
	movdqu	32(%rsi), %xmm4
	movdqu	48(%rsi), %xmm7
	leaq	52(%rsp), %rax
	leaq	308(%rsp), %rsi
	movq	%fs:40, %r10
	movq	%r10, 328(%rsp)
	movq	%rdi, %r10
	movdqa	%xmm2, %xmm5
	movdqa	%xmm9, %xmm0
	psrlw	$8, %xmm0
	psrlw	$8, %xmm5
	movdqa	%xmm7, %xmm1
	packuswb	%xmm0, %xmm5
	psrlw	$8, %xmm1
	movdqa	%xmm4, %xmm0
	psrlw	$8, %xmm0
	movdqa	%xmm5, %xmm3
	packuswb	%xmm1, %xmm0
	psrlw	$8, %xmm3
	movdqa	%xmm0, %xmm1
	psrlw	$8, %xmm1
	packuswb	%xmm1, %xmm3
	pcmpeqd	%xmm1, %xmm1
	psrlw	$8, %xmm1
	movdqa	%xmm3, %xmm6
	punpckhbw	%xmm8, %xmm3
	pand	%xmm1, %xmm9
	pand	%xmm1, %xmm7
	pand	%xmm1, %xmm2
	pand	%xmm1, %xmm4
	packuswb	%xmm9, %xmm2
	pand	%xmm1, %xmm0
	packuswb	%xmm7, %xmm4
	movdqa	%xmm1, %xmm7
	pand	%xmm1, %xmm5
	pand	%xmm2, %xmm7
	pand	%xmm4, %xmm1
	packuswb	%xmm0, %xmm5
	packuswb	%xmm1, %xmm7
	movdqa	%xmm2, %xmm1
	movdqa	%xmm5, %xmm0
	psrlw	$8, %xmm4
	psrlw	$8, %xmm1
	movdqa	%xmm7, %xmm9
	packuswb	%xmm4, %xmm1
	punpcklbw	%xmm8, %xmm0
	punpcklbw	%xmm8, %xmm9
	movdqa	%xmm1, %xmm10
	punpckhbw	%xmm8, %xmm1
	punpcklbw	%xmm8, %xmm6
	punpckhbw	%xmm8, %xmm5
	punpckhbw	%xmm8, %xmm7
	punpcklbw	%xmm8, %xmm10
	movdqa	%xmm1, %xmm4
	pxor	%xmm8, %xmm8
	movdqa	%xmm0, %xmm1
	movdqa	%xmm9, %xmm2
	punpcklwd	%xmm8, %xmm1
	punpckhwd	%xmm8, %xmm9
	psllw	$8, %xmm10
	pslld	$16, %xmm1
	punpcklwd	%xmm8, %xmm2
	pslld	$24, %xmm2
	pslld	$24, %xmm9
	movdqa	%xmm10, %xmm11
	por	%xmm2, %xmm1
	movdqa	%xmm6, %xmm2
	punpcklwd	%xmm8, %xmm11
	punpcklwd	%xmm8, %xmm2
	punpckhwd	%xmm8, %xmm10
	punpckhwd	%xmm8, %xmm6
	por	%xmm11, %xmm2
	psllw	$8, %xmm4
	por	%xmm10, %xmm6
	por	%xmm2, %xmm1
	movdqa	%xmm0, %xmm2
	movdqa	%xmm5, %xmm0
	punpckhwd	%xmm8, %xmm2
	punpcklwd	%xmm8, %xmm0
	movaps	%xmm1, (%rsp)
	psrldq	$8, %xmm1
	pslld	$16, %xmm2
	pslld	$16, %xmm0
	por	%xmm9, %xmm2
	movdqa	%xmm4, %xmm9
	punpckhwd	%xmm8, %xmm4
	por	%xmm6, %xmm2
	movdqa	%xmm7, %xmm6
	punpcklwd	%xmm8, %xmm9
	punpcklwd	%xmm8, %xmm6
	punpckhwd	%xmm8, %xmm7
	movaps	%xmm2, 16(%rsp)
	movq	%xmm2, %rdx
	pslld	$24, %xmm6
	pslld	$24, %xmm7
	psrldq	$8, %xmm2
	por	%xmm6, %xmm0
	movdqa	%xmm3, %xmm6
	punpckhwd	%xmm8, %xmm3
	punpcklwd	%xmm8, %xmm6
	por	%xmm4, %xmm3
	por	%xmm9, %xmm6
	por	%xmm6, %xmm0
	movaps	%xmm0, 32(%rsp)
	movdqa	%xmm5, %xmm0
	punpckhwd	%xmm8, %xmm0
	pslld	$16, %xmm0
	por	%xmm7, %xmm0
	por	%xmm3, %xmm0
	movaps	%xmm0, 48(%rsp)
	.p2align 4
	.p2align 3
.L2:
	movq	(%rax), %xmm0
	movq	-52(%rax), %xmm3
	movq	%xmm2, %rcx
	addq	$8, %rax
	movq	-28(%rax), %xmm2
	pxor	%xmm3, %xmm1
	pxor	%xmm2, %xmm0
	pxor	%xmm1, %xmm0
	movdqa	%xmm0, %xmm1
	pslld	$1, %xmm0
	psrld	$31, %xmm1
	por	%xmm1, %xmm0
	movq	%rdx, %xmm1
	movq	%rcx, %rdx
	movq	%xmm0, 4(%rax)
	cmpq	%rax, %rsi
	jne	.L2
	movdqu	(%r10), %xmm1
	movl	16(%r10), %r11d
	xorl	%edx, %edx
	movl	8(%r10), %esi
	movl	12(%r10), %ecx
	movl	4(%r10), %r8d
	movd	%xmm1, %edi
	movl	%r11d, %r9d
	jmp	.L8
	.p2align 6
	.p2align 4,,10
	.p2align 3
.L16:
	movl	%r8d, %ebp
	movl	$1859775393, %r12d
	xorl	%ecx, %ebp
	xorl	%esi, %ebp
.L4:
	movl	%edi, %eax
	rorl	$2, %r8d
	roll	$5, %eax
	addl	(%rsp,%rdx,4), %eax
	addq	$1, %rdx
	addl	%r12d, %eax
	addl	%ebp, %eax
	movl	%r8d, %ebp
	addl	%r9d, %eax
.L9:
	movl	%edi, %r8d
	movl	%ecx, %r9d
	movl	%eax, %edi
	movl	%esi, %ecx
	movl	%ebp, %esi
.L8:
	cmpq	$19, %rdx
	jbe	.L15
	cmpq	$39, %rdx
	jbe	.L16
	cmpq	$59, %rdx
	ja	.L6
	movl	%ecx, %ebp
	movl	%ecx, %eax
	movl	$-1894007588, %r12d
	orl	%esi, %ebp
	andl	%esi, %eax
	andl	%r8d, %ebp
	orl	%eax, %ebp
	jmp	.L4
	.p2align 4,,10
	.p2align 3
.L15:
	movl	%ecx, %ebp
	movl	$1518500249, %r12d
	xorl	%esi, %ebp
	andl	%r8d, %ebp
	xorl	%ecx, %ebp
	jmp	.L4
	.p2align 4,,10
	.p2align 3
.L6:
	movl	%r8d, %eax
	movl	%edi, %ebp
	rorl	$2, %r8d
	xorl	%ecx, %eax
	roll	$5, %ebp
	addl	(%rsp,%rdx,4), %ebp
	addq	$1, %rdx
	xorl	%esi, %eax
	leal	-899497514(%rbp,%rax), %eax
	movl	%r8d, %ebp
	addl	%r9d, %eax
	cmpq	$80, %rdx
	jne	.L9
	movd	%r8d, %xmm2
	movd	%esi, %xmm5
	movd	%eax, %xmm0
	addl	%ecx, %r11d
	movd	%edi, %xmm4
	punpckldq	%xmm5, %xmm2
	movl	%r11d, 16(%r10)
	punpckldq	%xmm4, %xmm0
	punpcklqdq	%xmm2, %xmm0
	paddd	%xmm1, %xmm0
	movups	%xmm0, (%r10)
	movq	328(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L17
	addq	$336, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L17:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE54:
	.size	transform, .-transform
	.p2align 4
	.type	hex, @function
hex:
.LFB58:
	.cfi_startproc
	xorl	%eax, %eax
	leaq	h.0(%rip), %rcx
	.p2align 6
	.p2align 4
	.p2align 3
.L19:
	movzbl	(%rdi,%rax), %edx
	shrb	$4, %dl
	andl	$15, %edx
	movzbl	(%rcx,%rdx), %edx
	movb	%dl, (%rsi,%rax,2)
	movzbl	(%rdi,%rax), %edx
	andl	$15, %edx
	movzbl	(%rcx,%rdx), %edx
	movb	%dl, 1(%rsi,%rax,2)
	addq	$1, %rax
	cmpq	$20, %rax
	jne	.L19
	movb	$0, 40(%rsi)
	ret
	.cfi_endproc
.LFE58:
	.size	hex, .-hex
	.p2align 4
	.type	median3, @function
median3:
.LFB68:
	.cfi_startproc
	movupd	(%rdi), %xmm0
	movapd	%xmm0, %xmm3
	unpckhpd	%xmm3, %xmm3
	comisd	%xmm3, %xmm0
	jbe	.L22
	shufpd	$1, %xmm0, %xmm0
	movups	%xmm0, (%rdi)
.L22:
	movsd	(%rdi), %xmm0
	movsd	16(%rdi), %xmm1
	comisd	%xmm1, %xmm0
	jbe	.L24
	movsd	%xmm1, (%rdi)
	movsd	%xmm0, 16(%rdi)
.L24:
	movupd	8(%rdi), %xmm0
	movapd	%xmm0, %xmm4
	unpckhpd	%xmm4, %xmm4
	comisd	%xmm4, %xmm0
	jbe	.L21
	shufpd	$1, %xmm0, %xmm0
	movups	%xmm0, 8(%rdi)
.L21:
	ret
	.cfi_endproc
.LFE68:
	.size	median3, .-median3
	.p2align 4
	.type	update, @function
update:
.LFB56:
	.cfi_startproc
	leaq	0(,%rdx,8), %rax
	addq	%rax, 24(%rdi)
	testq	%rdx, %rdx
	je	.L40
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movq	%rsi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%rdi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	leaq	32(%rdi), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rdx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	jmp	.L34
	.p2align 4,,10
	.p2align 3
.L33:
	testq	%rbp, %rbp
	je	.L43
.L34:
	movq	96(%r13), %rdi
	movl	$64, %ebx
	movq	%r14, %rsi
	subq	%rdi, %rbx
	cmpq	%rbp, %rbx
	cmova	%rbp, %rbx
	addq	%r12, %rdi
	movq	%rbx, %rdx
	addq	%rbx, %r14
	subq	%rbx, %rbp
	call	memcpy@PLT
	movq	96(%r13), %rax
	addq	%rbx, %rax
	movq	%rax, 96(%r13)
	cmpq	$64, %rax
	jne	.L33
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	transform
	movq	$0, 96(%r13)
	testq	%rbp, %rbp
	jne	.L34
.L43:
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L40:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	ret
	.cfi_endproc
.LFE56:
	.size	update, .-update
	.p2align 4
	.type	finish, @function
finish:
.LFB57:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %rbx
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	movq	96(%rdi), %rdx
	movq	24(%rdi), %r8
	leaq	1(%rdx), %rax
	movq	%rax, 96(%rdi)
	movb	$-128, 32(%rdi,%rdx)
	cmpq	$56, %rax
	ja	.L45
	movl	$56, %edx
	leaq	32(%rdi), %r12
	subq	%rax, %rdx
.L46:
	addq	%r12, %rax
	movl	%edx, %ecx
	cmpl	$8, %edx
	jnb	.L47
	testb	$4, %dl
	jne	.L64
	testl	%edx, %edx
	je	.L48
	movb	$0, (%rax)
	testb	$2, %dl
	jne	.L65
.L48:
	leaq	95(%rbx), %rax
	xorl	%ecx, %ecx
	.p2align 5
	.p2align 4
	.p2align 3
.L53:
	movq	%r8, %rdx
	subq	$1, %rax
	shrq	%cl, %rdx
	addl	$8, %ecx
	movb	%dl, 1(%rax)
	cmpl	$64, %ecx
	jne	.L53
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	transform
	xorl	%esi, %esi
.L54:
	leaq	0(%rbp,%rsi), %rdx
	movl	$24, %ecx
.L55:
	movl	(%rbx,%rsi), %eax
	addq	$1, %rdx
	shrl	%cl, %eax
	subl	$8, %ecx
	movb	%al, -1(%rdx)
	cmpl	$-8, %ecx
	jne	.L55
	addq	$4, %rsi
	cmpq	$20, %rsi
	jne	.L54
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L47:
	.cfi_restore_state
	leaq	8(%rax), %rsi
	movl	%edx, %ecx
	movq	$0, (%rax)
	movq	$0, -8(%rax,%rcx)
	andq	$-8, %rsi
	subq	%rsi, %rax
	leal	(%rdx,%rax), %ecx
	andl	$-8, %ecx
	cmpl	$8, %ecx
	jb	.L48
	andl	$-8, %ecx
	xorl	%eax, %eax
.L51:
	movl	%eax, %edx
	addl	$8, %eax
	movq	$0, (%rsi,%rdx)
	cmpl	%ecx, %eax
	jb	.L51
	jmp	.L48
	.p2align 4,,10
	.p2align 3
.L45:
	leaq	32(%rdi), %r12
	movl	$64, %edx
	xorl	%esi, %esi
	movq	%r8, 8(%rsp)
	subq	%rax, %rdx
	leaq	(%r12,%rax), %rdi
	call	memset@PLT
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	transform
	movq	$0, 96(%rbx)
	movq	8(%rsp), %r8
	xorl	%eax, %eax
	movl	$56, %edx
	jmp	.L46
.L64:
	movl	$0, (%rax)
	movl	$0, -4(%rax,%rcx)
	jmp	.L48
.L65:
	movl	%edx, %edx
	xorl	%ecx, %ecx
	movw	%cx, -2(%rax,%rdx)
	jmp	.L48
	.cfi_endproc
.LFE57:
	.size	finish, .-finish
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"blob %zu"
.LC3:
	.string	""
	.text
	.p2align 4
	.type	object_id, @function
object_id:
.LFB59:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rsi, %r9
	leaq	.LC1(%rip), %r8
	movq	%rsi, %r15
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	$64, %ecx
	movl	$64, %esi
	xorl	%eax, %eax
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rdi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdx, %r12
	movl	$2, %edx
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$232, %rsp
	.cfi_def_cfa_offset 288
	movq	%fs:40, %rbx
	movq	%rbx, 216(%rsp)
	xorl	%ebx, %ebx
	leaq	144(%rsp), %rdi
	leaq	112(%rsp), %rbp
	call	__snprintf_chk@PLT
	leaq	24(%rsp), %rdi
	movl	$10, %ecx
	movq	$0, 20(%rsp)
	movslq	%eax, %rdx
	movdqa	.LC2(%rip), %xmm0
	movq	$0, 96(%rsp)
	leaq	144(%rsp), %rsi
	movq	%rbx, %rax
	rep stosq
	movq	%rsp, %rdi
	movaps	%xmm0, (%rsp)
	movl	$-1009589776, 16(%rsp)
	call	update
	movl	$1, %edx
	leaq	.LC3(%rip), %rsi
	movq	%rsp, %rdi
	call	update
	movq	%r15, %rdx
	movq	%r13, %rsi
	movq	%rsp, %rdi
	call	update
	movq	%rbp, %rsi
	movq	%rsp, %rdi
	call	finish
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	hex
	movq	216(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L69
	addq	$232, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L69:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE59:
	.size	object_id, .-object_id
	.section	.rodata.str1.1
.LC4:
	.string	"write"
	.text
	.p2align 4
	.type	wr, @function
wr:
.LFB62:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	%edi, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdx, %rbx
	testq	%rdx, %rdx
	jne	.L76
	jmp	.L70
	.p2align 4,,10
	.p2align 3
.L72:
	je	.L74
	subq	%rax, %rbx
	je	.L70
	addq	%rax, %rbp
.L76:
	movq	%rbx, %rdx
	movq	%rbp, %rsi
	movl	%r12d, %edi
	call	write@PLT
	testq	%rax, %rax
	jns	.L72
	call	__errno_location@PLT
	cmpl	$4, (%rax)
	je	.L76
.L74:
	leaq	.LC4(%rip), %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
	.p2align 4,,10
	.p2align 3
.L70:
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE62:
	.size	wr, .-wr
	.section	.rodata.str1.1
.LC5:
	.string	"path too long\n"
	.text
	.p2align 4
	.type	join2.constprop.0, @function
join2.constprop.0:
.LFB78:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movq	%rdi, %r13
	movq	%rsi, %rdi
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rdx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$24, %rsp
	.cfi_def_cfa_offset 64
	movq	%rsi, 8(%rsp)
	call	strlen@PLT
	movq	%rbp, %rdi
	movq	%rax, %r12
	call	strlen@PLT
	movq	8(%rsp), %rsi
	movq	%rax, %rbx
	leaq	2(%r12,%rax), %rax
	cmpq	$512, %rax
	ja	.L94
	movq	%r12, %rdx
	movq	%r13, %rdi
	call	memcpy@PLT
	leaq	1(%rbx), %rcx
	movb	$47, 0(%r13,%r12)
	leaq	1(%r13,%r12), %rax
	cmpl	$8, %ecx
	jnb	.L86
	testb	$4, %cl
	jne	.L95
	testl	%ecx, %ecx
	je	.L84
	movzbl	0(%rbp), %edx
	movb	%dl, (%rax)
	testb	$2, %cl
	jne	.L96
.L84:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L86:
	.cfi_restore_state
	movq	0(%rbp), %rdx
	leaq	8(%rax), %rdi
	andq	$-8, %rdi
	movq	%rdx, (%rax)
	movl	%ecx, %edx
	movq	-8(%rbp,%rdx), %rsi
	movq	%rsi, -8(%rax,%rdx)
	subq	%rdi, %rax
	movq	%rbp, %rsi
	addl	%eax, %ecx
	subq	%rax, %rsi
	shrl	$3, %ecx
	rep movsq
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L95:
	.cfi_restore_state
	movl	0(%rbp), %edx
	movl	%ecx, %ecx
	movl	%edx, (%rax)
	movl	-4(%rbp,%rcx), %edx
	movl	%edx, -4(%rax,%rcx)
	jmp	.L84
	.p2align 4,,10
	.p2align 3
.L96:
	movl	%ecx, %ecx
	movzwl	-2(%rbp,%rcx), %edx
	movw	%dx, -2(%rax,%rcx)
	jmp	.L84
.L94:
	movq	stderr(%rip), %rdi
	leaq	.LC5(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	movl	$1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE78:
	.size	join2.constprop.0, .-join2.constprop.0
	.section	.rodata.str1.1
.LC6:
	.string	"plain"
.LC7:
	.string	"objects"
.LC8:
	.string	"opendir objects"
.LC9:
	.string	"opendir object prefix"
.LC10:
	.string	"closedir object prefix"
.LC11:
	.string	"rmdir object prefix"
.LC12:
	.string	"closedir objects"
.LC13:
	.string	"rmdir objects"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB14:
	.text
.LHOTB14:
	.p2align 4
	.type	clear_store, @function
clear_store:
.LFB50:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rdi, %rsi
	leaq	.LC6(%rip), %rdx
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$2088, %rsp
	.cfi_def_cfa_offset 2144
	movq	%fs:40, %rbp
	movq	%rbp, 2072(%rsp)
	movq	%rdi, %rbp
	leaq	16(%rsp), %rdi
	call	join2.constprop.0
	leaq	16(%rsp), %rdi
	call	unlink@PLT
	movl	%eax, %r15d
	testl	%eax, %eax
	je	.L98
	call	__errno_location@PLT
	cmpl	$2, (%rax)
	jne	.L134
	xorl	%r15d, %r15d
.L98:
	leaq	.LC7(%rip), %rdx
	movq	%rbp, %rsi
	leaq	528(%rsp), %rdi
	call	join2.constprop.0
	leaq	528(%rsp), %rdi
	call	opendir@PLT
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L142
	movl	$0, 12(%rsp)
	leaq	1552(%rsp), %rbp
	.p2align 4
	.p2align 3
.L99:
	movq	%r13, %rdi
	call	readdir@PLT
	testq	%rax, %rax
	je	.L143
.L111:
	cmpb	$46, 19(%rax)
	je	.L99
	leaq	19(%rax), %rdx
	leaq	528(%rsp), %rsi
	leaq	1040(%rsp), %rdi
	call	join2.constprop.0
	leaq	1040(%rsp), %rdi
	call	opendir@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L135
	.p2align 4
	.p2align 3
.L104:
	movq	%rbx, %rdi
	call	readdir@PLT
	testq	%rax, %rax
	je	.L144
.L107:
	cmpb	$46, 19(%rax)
	je	.L104
	movq	%rbp, %rdi
	leaq	19(%rax), %rdx
	leaq	1040(%rsp), %rsi
	call	join2.constprop.0
	movq	%rbp, %rdi
	call	unlink@PLT
	testl	%eax, %eax
	je	.L104
	call	__errno_location@PLT
	cmpl	$2, (%rax)
	jne	.L136
	movq	%rbx, %rdi
	call	readdir@PLT
	testq	%rax, %rax
	jne	.L107
.L144:
	movq	%rbx, %rdi
	call	closedir@PLT
	testl	%eax, %eax
	jne	.L137
.L108:
	leaq	1040(%rsp), %rdi
	call	rmdir@PLT
	testl	%eax, %eax
	jne	.L138
	movq	%r13, %rdi
	call	readdir@PLT
	testq	%rax, %rax
	jne	.L111
.L143:
	movq	%r13, %rdi
	call	closedir@PLT
	testl	%eax, %eax
	jne	.L139
	movl	12(%rsp), %eax
	testl	%eax, %eax
	jne	.L113
	leaq	528(%rsp), %rdi
	call	rmdir@PLT
	testl	%eax, %eax
	jne	.L140
.L114:
	negl	%r15d
	sbbl	%eax, %eax
.L97:
	movq	2072(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L145
	addq	$2088, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L142:
	.cfi_restore_state
	call	__errno_location@PLT
	cmpl	$2, (%rax)
	je	.L114
	jmp	.L100
.L145:
	call	__stack_chk_fail@PLT
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	clear_store.cold, @function
clear_store.cold:
.LFSB50:
.L139:
	.cfi_def_cfa_offset 2144
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	leaq	.LC12(%rip), %rdi
	call	perror@PLT
.L113:
	movl	$-1, %eax
	jmp	.L97
.L134:
	leaq	16(%rsp), %rdi
	movl	$-1, %r15d
	call	perror@PLT
	jmp	.L98
.L135:
	leaq	.LC9(%rip), %rdi
	call	perror@PLT
	movl	$1, 12(%rsp)
	jmp	.L99
.L100:
	leaq	.LC8(%rip), %rdi
	call	perror@PLT
	jmp	.L113
.L138:
	leaq	.LC11(%rip), %rdi
	call	perror@PLT
	movl	$1, 12(%rsp)
	jmp	.L99
.L137:
	leaq	.LC10(%rip), %rdi
	call	perror@PLT
	movl	$1, 12(%rsp)
	jmp	.L108
.L136:
	movq	%rbp, %rdi
	call	perror@PLT
	movl	$1, 12(%rsp)
	jmp	.L104
.L140:
	leaq	.LC13(%rip), %rdi
	call	perror@PLT
	jmp	.L113
	.cfi_endproc
.LFE50:
	.text
	.size	clear_store, .-clear_store
	.section	.text.unlikely
	.size	clear_store.cold, .-clear_store.cold
.LCOLDE14:
	.text
.LHOTE14:
	.section	.rodata.str1.1
.LC15:
	.string	"scratch reset failed\n"
.LC16:
	.string	"mkdir objects"
	.section	.text.unlikely
.LCOLDB17:
	.text
.LHOTB17:
	.p2align 4
	.type	reset_store, @function
reset_store:
.LFB69:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$536, %rsp
	.cfi_def_cfa_offset 560
	movq	%fs:40, %rbx
	movq	%rbx, 520(%rsp)
	movq	%rdi, %rbx
	call	clear_store
	testl	%eax, %eax
	jne	.L152
	movq	%rbx, %rsi
	movq	%rsp, %rdi
	leaq	.LC7(%rip), %rdx
	call	join2.constprop.0
	movl	$448, %esi
	movq	%rsp, %rdi
	call	mkdir@PLT
	testl	%eax, %eax
	jne	.L150
	movq	520(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L153
	addq	$536, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L152:
	.cfi_restore_state
	movq	stderr(%rip), %rdi
	leaq	.LC15(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	movl	$1, %edi
	call	exit@PLT
.L153:
	call	__stack_chk_fail@PLT
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	reset_store.cold, @function
reset_store.cold:
.LFSB69:
.L150:
	.cfi_def_cfa_offset 560
	.cfi_offset 3, -24
	.cfi_offset 6, -16
	leaq	.LC16(%rip), %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE69:
	.text
	.size	reset_store, .-reset_store
	.section	.text.unlikely
	.size	reset_store.cold, .-reset_store.cold
.LCOLDE17:
	.text
.LHOTE17:
	.section	.rodata.str1.1
.LC18:
	.string	"rmdir scratch root"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC19:
	.string	"scratch cleanup failed; path retained: %s\n"
	.section	.text.unlikely
.LCOLDB20:
	.text
.LHOTB20:
	.p2align 4
	.type	cleanup_at_exit, @function
cleanup_at_exit:
.LFB52:
	.cfi_startproc
	endbr64
	cmpb	$0, scratch_root(%rip)
	jne	.L166
	ret
	.p2align 4,,10
	.p2align 3
.L166:
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	leaq	scratch_root(%rip), %rdi
	call	clear_store
	testl	%eax, %eax
	jne	.L156
	leaq	scratch_root(%rip), %rdi
	call	rmdir@PLT
	testl	%eax, %eax
	je	.L157
	call	__errno_location@PLT
	cmpl	$2, (%rax)
	jne	.L161
.L157:
	movb	$0, scratch_root(%rip)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L156:
	.cfi_restore_state
	movq	stderr(%rip), %rdi
	movl	$2, %esi
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	leaq	scratch_root(%rip), %rcx
	leaq	.LC19(%rip), %rdx
	jmp	__fprintf_chk@PLT
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	cleanup_at_exit.cold, @function
cleanup_at_exit.cold:
.LFSB52:
.L161:
	.cfi_def_cfa_offset 16
	leaq	.LC18(%rip), %rdi
	call	perror@PLT
	jmp	.L156
	.cfi_endproc
.LFE52:
	.text
	.size	cleanup_at_exit, .-cleanup_at_exit
	.section	.text.unlikely
	.size	cleanup_at_exit.cold, .-cleanup_at_exit.cold
.LCOLDE20:
	.text
.LHOTE20:
	.section	.rodata.str1.1
.LC21:
	.string	"open plain"
.LC22:
	.string	"clock_gettime"
	.section	.rodata.str1.8
	.align 8
.LC23:
	.string	"record %04d: generated architecture storage payload; same length for every record"
	.section	.rodata.str1.1
.LC25:
	.string	"mkdir"
.LC26:
	.string	"open loose-style"
.LC27:
	.string	"blob %d"
.LC28:
	.string	"fsync object"
.LC29:
	.string	"close"
.LC30:
	.string	"fsync append"
	.section	.text.unlikely
.LCOLDB33:
	.text
.LHOTB33:
	.p2align 4
	.type	store_trial, @function
store_trial:
.LFB67:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	%esi, %r12d
	movq	%rdi, %rsi
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	subq	$1960, %rsp
	.cfi_def_cfa_offset 2016
	movl	%edx, 20(%rsp)
	leaq	400(%rsp), %rdi
	movq	%fs:40, %rdx
	movq	%rdx, 1944(%rsp)
	leaq	.LC6(%rip), %rdx
	call	join2.constprop.0
	testl	%r12d, %r12d
	jne	.L182
	movl	$384, %edx
	movl	$577, %esi
	leaq	400(%rsp), %rdi
	xorl	%eax, %eax
	call	open@PLT
	movl	%eax, 16(%rsp)
	testl	%eax, %eax
	js	.L205
.L168:
	leaq	1424(%rsp), %rax
	leaq	.LC7(%rip), %rdx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	movq	%rax, 24(%rsp)
	call	join2.constprop.0
	leaq	48(%rsp), %rsi
	movl	$1, %edi
	call	clock_gettime@PLT
	movl	%eax, %r15d
	testl	%eax, %eax
	jne	.L178
	movq	48(%rsp), %rax
	movq	56(%rsp), %rbx
	movl	$538976288, %edx
	leaq	192(%rsp), %rbp
	movd	%edx, %xmm5
	pshufd	$0, %xmm5, %xmm4
	movq	%rax, 32(%rsp)
	movq	%rbx, 40(%rsp)
	movaps	%xmm4, (%rsp)
	jmp	.L176
	.p2align 4,,10
	.p2align 3
.L212:
	leaq	144(%rsp), %rdx
	movl	$200, %esi
	movq	%rbp, %rdi
	call	object_id
	movl	sink(%rip), %edx
	movzbl	144(%rsp), %eax
	leaq	912(%rsp), %rdi
	movq	24(%rsp), %rsi
	movb	$0, 95(%rsp)
	xorl	%edx, %eax
	leaq	93(%rsp), %rdx
	movl	%eax, sink(%rip)
	movzwl	144(%rsp), %eax
	movw	%ax, 93(%rsp)
	call	join2.constprop.0
	movl	$448, %esi
	leaq	912(%rsp), %rdi
	call	mkdir@PLT
	testl	%eax, %eax
	je	.L171
	call	__errno_location@PLT
	cmpl	$17, (%rax)
	jne	.L206
.L171:
	leaq	146(%rsp), %rdx
	leaq	912(%rsp), %rsi
	leaq	400(%rsp), %rdi
	call	join2.constprop.0
	movl	$384, %edx
	movl	$193, %esi
	xorl	%eax, %eax
	leaq	400(%rsp), %rdi
	call	open@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	js	.L207
	movl	$200, %r9d
	leaq	.LC27(%rip), %r8
	movl	$40, %ecx
	movl	$2, %edx
	movl	$40, %esi
	leaq	96(%rsp), %rdi
	xorl	%eax, %eax
	call	__snprintf_chk@PLT
	movl	$8, %edx
	leaq	96(%rsp), %rsi
	movl	%ebx, %edi
	call	wr
	movl	$1, %edx
	leaq	.LC3(%rip), %rsi
	movl	%ebx, %edi
	call	wr
	movl	$200, %edx
	movq	%rbp, %rsi
	movl	%ebx, %edi
	call	wr
	movl	20(%rsp), %eax
	testl	%eax, %eax
	je	.L173
	movl	%ebx, %edi
	call	fsync@PLT
	testl	%eax, %eax
	jne	.L208
.L173:
	movl	%ebx, %edi
	call	close@PLT
	testl	%eax, %eax
	jne	.L180
	addl	$1, %r15d
	cmpl	$2000, %r15d
	je	.L211
.L176:
	movl	%r15d, %r9d
	leaq	.LC23(%rip), %r8
	movq	%rbp, %rdi
	xorl	%eax, %eax
	movl	$200, %ecx
	movl	$2, %edx
	movl	$200, %esi
	call	__snprintf_chk@PLT
	movdqa	(%rsp), %xmm3
	movabsq	$2314885530818453536, %rax
	movups	%xmm3, 369(%rsp)
	movups	%xmm3, 273(%rsp)
	movq	%rax, 384(%rsp)
	movups	%xmm3, 289(%rsp)
	movups	%xmm3, 305(%rsp)
	movups	%xmm3, 321(%rsp)
	movups	%xmm3, 337(%rsp)
	movups	%xmm3, 353(%rsp)
	testl	%r12d, %r12d
	jne	.L212
	movl	16(%rsp), %edi
	movl	$200, %edx
	movq	%rbp, %rsi
	addl	$1, %r15d
	call	wr
	cmpl	$2000, %r15d
	jne	.L176
.L211:
	movq	40(%rsp), %rbx
	xorl	$1, %r12d
	testl	%r12d, 20(%rsp)
	jne	.L213
.L177:
	leaq	64(%rsp), %rsi
	movl	$1, %edi
	call	clock_gettime@PLT
	testl	%eax, %eax
	jne	.L178
	movl	16(%rsp), %eax
	movq	64(%rsp), %rbp
	movq	72(%rsp), %r12
	cmpl	$-1, %eax
	jne	.L214
.L179:
	movsd	.LC31(%rip), %xmm2
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%r12, %xmm0
	cvtsi2sdq	%rbp, %xmm1
	divsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rbx, %xmm1
	divsd	%xmm2, %xmm1
	pxor	%xmm2, %xmm2
	cvtsi2sdq	32(%rsp), %xmm2
	addsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movq	1944(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L215
	addq	$1960, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L182:
	.cfi_restore_state
	movl	$-1, 16(%rsp)
	jmp	.L168
.L213:
	movl	16(%rsp), %edi
	call	fsync@PLT
	testl	%eax, %eax
	je	.L177
	jmp	.L209
	.p2align 4,,10
	.p2align 3
.L214:
	movl	%eax, %edi
	call	close@PLT
	testl	%eax, %eax
	je	.L179
	jmp	.L180
.L215:
	call	__stack_chk_fail@PLT
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	store_trial.cold, @function
store_trial.cold:
.LFSB67:
.L178:
	.cfi_def_cfa_offset 2016
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	leaq	.LC22(%rip), %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
.L205:
	leaq	.LC21(%rip), %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
.L180:
	leaq	.LC29(%rip), %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
.L208:
	leaq	.LC28(%rip), %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
.L207:
	leaq	.LC26(%rip), %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
.L206:
	leaq	.LC25(%rip), %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
.L209:
	leaq	.LC30(%rip), %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE67:
	.text
	.size	store_trial, .-store_trial
	.section	.text.unlikely
	.size	store_trial.cold, .-store_trial.cold
.LCOLDE33:
	.text
.LHOTE33:
	.section	.rodata.str1.1
.LC34:
	.string	"PASS"
.LC35:
	.string	"FAIL"
.LC36:
	.string	"/tmp"
.LC38:
	.string	"no_sync"
.LC39:
	.string	"sync_at_end"
.LC40:
	.string	"sync_each_object"
.LC41:
	.string	"unknown"
	.section	.rodata.str1.8
	.align 8
.LC42:
	.string	"9p (WSL2 Windows drive share or similar)"
	.section	.rodata.str1.1
.LC43:
	.string	"btrfs"
.LC44:
	.string	"xfs"
.LC45:
	.string	"ext2/3/4"
.LC46:
	.string	"--hash"
.LC47:
	.string	"rb"
.LC48:
	.string	"fopen"
.LC49:
	.string	"seek"
.LC50:
	.string	"malloc"
.LC51:
	.string	"fread"
.LC52:
	.string	"fclose"
.LC53:
	.string	"--vectors"
.LC54:
	.string	"abc"
	.section	.rodata.str1.8
	.align 8
.LC55:
	.string	"da39a3ee5e6b4b0d3255bfef95601890afd80709"
	.align 8
.LC56:
	.string	"a9993e364706816aba3e25717850c26c9cd0d89d"
	.section	.rodata.str1.1
.LC57:
	.string	"abc=%s %s\nempty=%s %s\n"
.LC58:
	.string	"--"
	.section	.rodata.str1.8
	.align 8
.LC59:
	.string	"usage: %s [scratch-dir]\n       %s --hash path\n       %s --vectors\n"
	.section	.rodata.str1.1
.LC60:
	.string	"scratch directory"
.LC61:
	.string	"%s/arch-repo-XXXXXX"
.LC62:
	.string	"scratch path too long\n"
.LC63:
	.string	"mkdtemp"
.LC64:
	.string	"%s"
.LC65:
	.string	"could not register cleanup\n"
.LC66:
	.string	"r"
.LC67:
	.string	"/proc/cpuinfo"
.LC68:
	.string	"model name"
.LC69:
	.string	"\n"
.LC70:
	.string	"fclose cpuinfo"
.LC71:
	.string	"%Y-%m-%dT%H:%M:%SZ"
	.section	.rodata.str1.8
	.align 8
.LC72:
	.string	"# experiment=repository\n# host=%s\n# cpu=%s\n# date_utc=%s\n# flags=-std=c11 -O2 -Wall -Wextra\n"
	.section	.rodata.str1.1
.LC73:
	.string	"statfs"
	.section	.rodata.str1.8
	.align 8
.LC74:
	.string	"trial,store,sync,seconds,batches_of_2000_records,ms_per_batch"
	.section	.rodata.str1.1
.LC77:
	.string	"one_plain_file"
.LC78:
	.string	"%d,%s,%s,%.6f,%u,%.4f\n"
.LC79:
	.string	"# median,%s,%s,%.6f,%.4f\n"
.LC80:
	.string	"loose_object_style"
.LC81:
	.string	"# filesystem_type=0x%lx (%s)\n"
.LC82:
	.string	"tmpfs"
	.section	.rodata.str1.8
	.align 8
.LC83:
	.string	"# WARNING: tmpfs is RAM, not disk; sync timings are not meaningful"
	.section	.text.unlikely
.LCOLDB84:
	.section	.text.startup,"ax",@progbits
.LHOTB84:
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB71:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$2296, %rsp
	.cfi_def_cfa_offset 2352
	movq	%fs:40, %rbp
	movq	%rbp, 2280(%rsp)
	movq	%rsi, %rbp
	cmpl	$3, %edi
	je	.L308
	cmpl	$2, %edi
	je	.L309
	jg	.L218
	leaq	.LC36(%rip), %rbx
.L232:
	leaq	272(%rsp), %rsi
	movq	%rbx, %rdi
	call	stat@PLT
	testl	%eax, %eax
	jne	.L233
	movl	296(%rsp), %eax
	andl	$61440, %eax
	cmpl	$16384, %eax
	jne	.L233
	xorl	%eax, %eax
	movq	%rbx, %r9
	movl	$256, %ecx
	movl	$2, %edx
	leaq	480(%rsp), %rbp
	leaq	.LC61(%rip), %r8
	movl	$256, %esi
	movq	%rbp, %rdi
	call	__snprintf_chk@PLT
	cmpl	$255, %eax
	jg	.L310
	movq	%rbp, %rdi
	call	mkdtemp@PLT
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L300
	movq	%rax, %rdi
	call	strlen@PLT
	cmpq	$255, %rax
	ja	.L311
	leaq	scratch_root(%rip), %rdi
	xorl	%eax, %eax
	movq	%rbp, %rcx
	movl	$256, %esi
	leaq	.LC64(%rip), %rdx
	call	snprintf@PLT
	leaq	cleanup_at_exit(%rip), %rdi
	call	atexit@PLT
	testl	%eax, %eax
	jne	.L312
	movq	%rbp, %rsi
	leaq	1248(%rsp), %rdi
	leaq	.LC7(%rip), %rdx
	call	join2.constprop.0
	movl	$448, %esi
	leaq	1248(%rsp), %rdi
	call	mkdir@PLT
	testl	%eax, %eax
	je	.L240
	call	__errno_location@PLT
	cmpl	$17, (%rax)
	jne	.L301
.L240:
	movabsq	$31093567915781749, %rbx
	xorl	%esi, %esi
	xorl	%eax, %eax
	movl	$60, %ecx
	leaq	752(%rsp), %rdi
	movq	%rbx, 736(%rsp)
	movabsq	$7020584519046819693, %r13
	movq	%rsi, 744(%rsp)
	rep stosl
	leaq	1008(%rsp), %rdi
	movl	$60, %ecx
	movq	%rbx, 992(%rsp)
	movq	%rsi, 1000(%rsp)
	rep stosl
	leaq	432(%rsp), %rdi
	movl	$12, %ecx
	movq	%rsi, 424(%rsp)
	rep stosl
	movl	$256, %esi
	leaq	736(%rsp), %rdi
	movq	%rbx, 416(%rsp)
	leaq	1760(%rsp), %rbx
	call	gethostname@PLT
	leaq	.LC66(%rip), %rsi
	leaq	.LC67(%rip), %rdi
	movb	$0, 991(%rsp)
	call	fopen@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L242
	.p2align 4
	.p2align 3
.L241:
	movq	%r12, %rdx
	movl	$512, %esi
	movq	%rbx, %rdi
	call	fgets@PLT
	testq	%rax, %rax
	je	.L245
	cmpq	%r13, (%rbx)
	jne	.L241
	cmpw	$25965, 8(%rbx)
	jne	.L241
	movl	$58, %esi
	movq	%rbx, %rdi
	call	strchr@PLT
	testq	%rax, %rax
	je	.L245
	leaq	2(%rax), %rcx
	movl	$256, %esi
	xorl	%eax, %eax
	leaq	.LC64(%rip), %rdx
	leaq	992(%rsp), %rdi
	call	snprintf@PLT
	leaq	.LC69(%rip), %rsi
	leaq	992(%rsp), %rdi
	call	strcspn@PLT
	movb	$0, 992(%rsp,%rax)
.L245:
	movq	%r12, %rdi
	call	fclose@PLT
	testl	%eax, %eax
	jne	.L302
.L242:
	xorl	%edi, %edi
	call	time@PLT
	leaq	40(%rsp), %rdi
	leaq	48(%rsp), %rsi
	movq	%rax, 40(%rsp)
	call	gmtime_r@PLT
	testq	%rax, %rax
	je	.L248
	leaq	48(%rsp), %rcx
	leaq	.LC71(%rip), %rdx
	movl	$64, %esi
	leaq	416(%rsp), %rdi
	call	strftime@PLT
.L248:
	leaq	.LC72(%rip), %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	leaq	992(%rsp), %rcx
	leaq	416(%rsp), %r8
	leaq	736(%rsp), %rdx
	call	__printf_chk@PLT
	leaq	144(%rsp), %rsi
	movq	%rbp, %rdi
	call	statfs@PLT
	testl	%eax, %eax
	jne	.L249
	movq	144(%rsp), %rdx
	cmpq	$61267, %rdx
	je	.L273
	cmpq	$16914836, %rdx
	je	.L251
	cmpq	$1481003842, %rdx
	je	.L274
	movl	$2435016766, %eax
	cmpq	%rax, %rdx
	je	.L275
	leaq	.LC41(%rip), %rcx
	cmpq	$16914839, %rdx
	jne	.L250
	leaq	.LC42(%rip), %rcx
	jmp	.L250
.L309:
	movq	8(%rbp), %rbx
	leaq	.LC53(%rip), %rsi
	movq	%rbx, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L313
	cmpb	$0, (%rbx)
	je	.L218
	movl	$2, %edx
	leaq	.LC58(%rip), %rsi
	movq	%rbx, %rdi
	call	strncmp@PLT
	testl	%eax, %eax
	jne	.L232
.L218:
	movq	0(%rbp), %rcx
	movq	stderr(%rip), %rdi
	leaq	.LC59(%rip), %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	movq	%rcx, %r9
	movq	%rcx, %r8
	call	__fprintf_chk@PLT
	movl	$2, %eax
.L216:
	movq	2280(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L314
	addq	$2296, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L308:
	.cfi_restore_state
	movq	8(%rbp), %rdi
	leaq	.LC46(%rip), %rsi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L218
	movq	16(%rbp), %rdi
	leaq	.LC47(%rip), %rsi
	call	fopen@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L296
	xorl	%esi, %esi
	movl	$2, %edx
	movq	%rax, %rdi
	call	fseek@PLT
	testl	%eax, %eax
	jne	.L221
	movq	%rbx, %rdi
	call	ftell@PLT
	testq	%rax, %rax
	js	.L221
	movq	%rbx, %rdi
	call	ftell@PLT
	movq	%rbx, %rdi
	movq	%rax, %r12
	call	rewind@PLT
	leaq	1(%r12), %rdi
	call	malloc@PLT
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L297
	movq	%rbx, %r8
	movq	%r12, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	leaq	1(%r12), %rsi
	call	__fread_chk@PLT
	cmpq	%rax, %r12
	jne	.L298
	movq	%rbx, %rdi
	call	fclose@PLT
	testl	%eax, %eax
	jne	.L299
	leaq	1760(%rsp), %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	object_id
	leaq	1760(%rsp), %rdi
	call	puts@PLT
	movq	%rbp, %rdi
	call	free@PLT
.L225:
	xorl	%eax, %eax
	jmp	.L216
.L310:
	movq	stderr(%rip), %rdi
	leaq	.LC62(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
.L235:
	movl	$1, %eax
	jmp	.L216
.L312:
	movq	stderr(%rip), %rdi
	leaq	.LC65(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	jmp	.L235
.L311:
	movq	stderr(%rip), %rdi
	leaq	.LC62(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	jmp	.L235
.L313:
	movl	$21, %ecx
	leaq	164(%rsp), %rdi
	movdqa	.LC2(%rip), %xmm0
	leaq	144(%rsp), %rbp
	rep stosl
	movl	$3, %edx
	movq	%rbp, %rdi
	movl	%eax, 8(%rsp)
	leaq	.LC54(%rip), %rsi
	movaps	%xmm0, 144(%rsp)
	movl	$-1009589776, 160(%rsp)
	call	update
	movq	%rbp, %rdi
	leaq	736(%rsp), %rsi
	leaq	1248(%rsp), %rbp
	call	finish
	movl	8(%rsp), %eax
	leaq	292(%rsp), %rdi
	movl	$21, %ecx
	movdqa	.LC2(%rip), %xmm0
	leaq	992(%rsp), %rsi
	rep stosl
	leaq	272(%rsp), %rdi
	movl	$-1009589776, 288(%rsp)
	movaps	%xmm0, 272(%rsp)
	call	finish
	movq	%rbp, %rsi
	leaq	736(%rsp), %rdi
	call	hex
	leaq	1760(%rsp), %rsi
	leaq	992(%rsp), %rdi
	call	hex
	leaq	.LC55(%rip), %rsi
	leaq	1760(%rsp), %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L315
	leaq	.LC35(%rip), %r12
.L228:
	leaq	.LC56(%rip), %rsi
	movq	%rbp, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L271
	leaq	.LC34(%rip), %rcx
.L229:
	movq	%r12, %r9
	leaq	1760(%rsp), %r8
	movq	%rbp, %rdx
	xorl	%eax, %eax
	leaq	.LC57(%rip), %rsi
	movl	$2, %edi
	call	__printf_chk@PLT
	leaq	.LC56(%rip), %rsi
	movq	%rbp, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	movl	$1, %eax
	jne	.L216
	leaq	.LC55(%rip), %rsi
	leaq	1760(%rsp), %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	setne	%al
	movzbl	%al, %eax
	jmp	.L216
.L273:
	leaq	.LC45(%rip), %rcx
.L250:
	leaq	.LC81(%rip), %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
.L265:
	leaq	.LC74(%rip), %rdi
	xorl	%r12d, %r12d
	call	puts@PLT
	xorl	%edx, %edx
	xorl	%esi, %esi
	movq	%rbp, %rdi
	call	store_trial
	movq	%rbp, %rdi
	call	reset_store
	leaq	112(%rsp), %rax
	movq	%rax, 16(%rsp)
.L252:
	testl	%r12d, %r12d
	leaq	.LC38(%rip), %rax
	leaq	.LC39(%rip), %rcx
	cmovne	%rcx, %rax
	xorl	%r13d, %r13d
	movq	%rax, 24(%rsp)
.L262:
	movl	$1, %r14d
.L261:
	movq	$0x000000000, 8(%rsp)
	xorl	%ebx, %ebx
	.p2align 4
	.p2align 3
.L253:
	movl	%r12d, %edx
	movl	%r13d, %esi
	movq	%rbp, %rdi
	addl	$1, %ebx
	call	store_trial
	addsd	8(%rsp), %xmm0
	movq	%rbp, %rdi
	movsd	%xmm0, 8(%rsp)
	call	reset_store
	movsd	.LC75(%rip), %xmm3
	comisd	8(%rsp), %xmm3
	ja	.L253
	movsd	8(%rsp), %xmm4
	movsd	.LC76(%rip), %xmm1
	pxor	%xmm0, %xmm0
	movq	16(%rsp), %rax
	mulsd	%xmm4, %xmm1
	movsd	%xmm4, -8(%rax,%r14,8)
	movl	%ebx, %eax
	cvtsi2sdq	%rax, %xmm0
	divsd	%xmm0, %xmm1
	movsd	%xmm1, 136(%rsp,%r14,8)
	testl	%r12d, %r12d
	je	.L256
	leaq	.LC39(%rip), %r8
	testl	%r13d, %r13d
	je	.L258
	movsd	8(%rsp), %xmm0
	movl	%r14d, %edx
	movl	%ebx, %r9d
	leaq	.LC40(%rip), %r8
	leaq	.LC80(%rip), %rcx
	leaq	.LC78(%rip), %rsi
	movl	$2, %edi
	movl	$2, %eax
	call	__printf_chk@PLT
	addq	$1, %r14
	cmpq	$4, %r14
	jne	.L261
	movq	16(%rsp), %rdi
	leaq	.LC40(%rip), %rcx
	call	median3
	leaq	144(%rsp), %rdi
	call	median3
	movsd	120(%rsp), %xmm0
	movsd	152(%rsp), %xmm1
.L266:
	leaq	.LC80(%rip), %rdx
	movl	$2, %edi
	movl	$2, %eax
	leaq	.LC79(%rip), %rsi
	call	__printf_chk@PLT
	leal	1(%r12), %eax
	movl	$1, %r12d
	cmpl	$2, %eax
	jne	.L252
	cmpb	$0, scratch_root(%rip)
	je	.L225
	leaq	scratch_root(%rip), %rdi
	call	clear_store
	testl	%eax, %eax
	jne	.L235
	leaq	scratch_root(%rip), %rdi
	call	rmdir@PLT
	testl	%eax, %eax
	je	.L263
	call	__errno_location@PLT
	cmpl	$2, (%rax)
	jne	.L303
.L263:
	movb	$0, scratch_root(%rip)
	xorl	%eax, %eax
	jmp	.L216
.L316:
	leaq	.LC38(%rip), %r8
.L258:
	movl	%r14d, %edx
	movsd	8(%rsp), %xmm0
	movl	%ebx, %r9d
	addq	$1, %r14
	leaq	.LC77(%rip), %rcx
	movl	$2, %edi
	movl	$2, %eax
	leaq	.LC78(%rip), %rsi
	call	__printf_chk@PLT
	cmpq	$4, %r14
	jne	.L261
	movq	16(%rsp), %rdi
	movl	$2, %eax
	leaq	.LC77(%rip), %rdx
	leaq	.LC79(%rip), %rsi
	movl	$1, %r13d
	call	median3
	leaq	144(%rsp), %rdi
	call	median3
	movsd	120(%rsp), %xmm0
	movq	24(%rsp), %rcx
	movl	$2, %edi
	movsd	152(%rsp), %xmm1
	call	__printf_chk@PLT
	jmp	.L262
	.p2align 4,,10
	.p2align 3
.L256:
	testl	%r13d, %r13d
	je	.L316
	movsd	8(%rsp), %xmm0
	movl	%r14d, %edx
	movl	%ebx, %r9d
	leaq	.LC38(%rip), %r8
	leaq	.LC80(%rip), %rcx
	leaq	.LC78(%rip), %rsi
	movl	$2, %edi
	movl	$2, %eax
	call	__printf_chk@PLT
	addq	$1, %r14
	cmpq	$4, %r14
	jne	.L261
	movq	16(%rsp), %rdi
	leaq	.LC38(%rip), %rcx
	call	median3
	leaq	144(%rsp), %rdi
	call	median3
	movsd	120(%rsp), %xmm0
	movsd	152(%rsp), %xmm1
	jmp	.L266
.L315:
	leaq	.LC34(%rip), %r12
	jmp	.L228
.L275:
	leaq	.LC43(%rip), %rcx
	jmp	.L250
.L251:
	leaq	.LC82(%rip), %rcx
	movl	$16914836, %edx
	leaq	.LC81(%rip), %rsi
	xorl	%eax, %eax
	movl	$2, %edi
	call	__printf_chk@PLT
	leaq	.LC83(%rip), %rdi
	call	puts@PLT
	jmp	.L265
.L271:
	leaq	.LC35(%rip), %rcx
	jmp	.L229
.L274:
	leaq	.LC44(%rip), %rcx
	jmp	.L250
.L314:
	call	__stack_chk_fail@PLT
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	main.cold, @function
main.cold:
.LFSB71:
.L300:
	.cfi_def_cfa_offset 2352
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	leaq	.LC63(%rip), %rdi
	call	perror@PLT
	jmp	.L235
.L301:
	leaq	.LC25(%rip), %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
.L233:
	leaq	.LC60(%rip), %rdi
	call	perror@PLT
	jmp	.L235
.L249:
	leaq	.LC73(%rip), %rdi
	call	perror@PLT
	jmp	.L265
.L303:
	leaq	.LC18(%rip), %rdi
	call	perror@PLT
	jmp	.L235
.L302:
	leaq	.LC70(%rip), %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
.L299:
	leaq	.LC52(%rip), %rdi
	call	perror@PLT
	movq	%rbp, %rdi
	call	free@PLT
	movl	$1, %edi
	call	exit@PLT
.L298:
	leaq	.LC51(%rip), %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
.L297:
	leaq	.LC50(%rip), %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
.L221:
	leaq	.LC49(%rip), %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
.L296:
	leaq	.LC48(%rip), %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE71:
	.section	.text.startup
	.size	main, .-main
	.section	.text.unlikely
	.size	main.cold, .-main.cold
.LCOLDE84:
	.section	.text.startup
.LHOTE84:
	.section	.rodata
	.align 16
	.type	h.0, @object
	.size	h.0, 17
h.0:
	.string	"0123456789abcdef"
	.local	scratch_root
	.comm	scratch_root,256,32
	.local	sink
	.comm	sink,4,4
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC2:
	.long	1732584193
	.long	-271733879
	.long	-1732584194
	.long	271733878
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC31:
	.long	0
	.long	1104006501
	.align 8
.LC75:
	.long	-1717986918
	.long	1068079513
	.align 8
.LC76:
	.long	0
	.long	1083129856
	.ident	"GCC: (Ubuntu 15.2.0-16ubuntu1) 15.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
