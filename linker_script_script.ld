SECTIONS
{
    . = 0x0;
    .data.script : {
        *(.data.script)
    }
    . = 0x0;
    .data.oam (NOLOAD) : {
        *(.data.oam)
    }
}
