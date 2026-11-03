"""Layout constants of this game's GAME.bin (Pools of Darkness 1.10, TP 6.0)."""
DSSEG = 0x9E7          # data segment paragraph
SYSSEG = 0x825         # System code segment
TPL = {0x741: 'Crt', 0x7A3: 'Dos', 0x7CF: 'Overlay', 0x825: 'System'}
FIRST_SEG = 0x30       # first segment after the main program
ENTRY = 0x0002         # main block entry (start of the unit init call chain)
CONST_START, CONST_END = 0x0002, 0x7D8C   # game typed constants (TBD)
VAR_START, VAR_END = 0x7DDE, 0xFB76       # game variables (TBD)
