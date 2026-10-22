	.file	"sum_array.c"
	.intel_syntax noprefix
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%ld\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	endbr64
	sub	rsp, 8
	.cfi_def_cfa_offset 16
	mov	eax, 0
	lea	rdx, numbers[rip]
	.p2align 4
.L2:
	mov	QWORD PTR [rdx+rax*8], rax
	add	rax, 1
	cmp	rax, 1000000
	jne	.L2
	lea	rax, numbers[rip]
	lea	rsi, 8000000[rax]
	mov	ecx, 0
	.p2align 4
.L3:
	add	rcx, QWORD PTR [rax]
	mov	rdx, rcx
	add	rax, 8
	cmp	rax, rsi
	jne	.L3
	lea	rsi, .LC0[rip]
	mov	edi, 2
	mov	eax, 0
	call	__printf_chk@PLT
	mov	eax, 0
	add	rsp, 8
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.local	numbers
	.comm	numbers,8000000,32
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
