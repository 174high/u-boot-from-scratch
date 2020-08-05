/*
 * start.S
 *
 * Copyright(c) 2007-2018 Jianjun Jiang <8192542@qq.com>
 * Official site: http://xboot.org
 * Mobile phone: +86-18665388956
 * QQ: 8192542
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software Foundation,
 * Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *
 */

/*
 * Exception vector table
 */
.text
	.arm

	.global	_start
_start:
	/* Boot head information for BROM */
	.long 0xea000016
	.byte 'e', 'G', 'O', 'N', '.', 'B', 'T', '0'
	.long 0, 0
	.byte 'S', 'P', 'L', 2
	.long 0, 0
	.long 0, 0, 0, 0, 0, 0, 0, 0
	.long 0, 0, 0, 0, 0, 0, 0, 0	/* 0x40 - boot params, 0x58 - fel boot type, 0x5c - dram size */

_vector:
	b reset
	ldr pc, _undefined_instruction
	ldr pc, _software_interrupt
	ldr pc, _prefetch_abort
	ldr pc, _data_abort
	ldr pc, _not_used
	ldr pc, _irq
	ldr pc, _fiq

_undefined_instruction:
	.word undefined_instruction
_software_interrupt:
	.word software_interrupt
_prefetch_abort:
	.word prefetch_abort
_data_abort:
	.word data_abort
_not_used:
	.word not_used
_irq:
	.word irq
_fiq:
	.word fiq

/*
 * The actual reset code
 */
reset:


/*
 * Exception handlers
 */
	.align 5
undefined_instruction:
	b .

	.align 5
software_interrupt:
	b .

	.align 5
prefetch_abort:
	b .

	.align 5
data_abort:
	b .

	.align 5
not_used:
	b .

	.align 5
irq:

	.align 5
fiq:

