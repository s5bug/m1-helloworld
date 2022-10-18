.extern _write
.extern _exit

.global _main
.align 4

.text
_main:
    mov x0, #1
    adrp x1, hello_world_str@PAGE
    add x1, x1, hello_world_str@PAGEOFF
    mov x2, #14
    bl _write

    mov x0, #0
    bl _exit

.data
hello_world_str:
    .ascii "Hello, world!\n"
