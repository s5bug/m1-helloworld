; libSystem.write
;     (fd : int/i32 {x0}, buf : *void/*u8 {x1}, count : size_t/u64 {x2})
;     -> (written : ssize_t/i64)
.extern _write
; libSystem.exit
;     (status : int/i32)
;     -> nothing
.extern _exit

.global _main
.align 4

.text
_main:
    ; fd = stdout
    mov x0, #1
    ; buf = &hello_world_str
    adrp x1, hello_world_str@PAGE
    add x1, x1, hello_world_str@PAGEOFF
    ; count = 14
    mov x2, #14
    bl _write

    ; status = 0
    mov x0, #0
    bl _exit

.data
; hello_world_str : [14]u8
hello_world_str:
    .ascii "Hello, world!\n"
