SECTIONS
{
    . = 0x0;
    .data.oam :
    {
        *(.data.oam)
    }
    . = 0x0;
    .data.script (NOLOAD) :
    {
        *(.data.script)
    }
}
