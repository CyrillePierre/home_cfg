define pdbg
	source /home/eseris/share/pwndbg/gdbinit.py
	set print elements 0
end

define peda
	source /home/eseris/share/peda/peda.py
end

define gef
	source /home/eseris/share/gef/gef.py
end

set print asm-demangle on
set breakpoint pending on
