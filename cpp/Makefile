CFLAGS=-O2 -Wall -Werror  
cmdline_getopts: cmdline_getopts.o
	g++ $(CFLAGS) -o cmdline cmdline_getopts.o 
cmdline_getopts.o:
	gcc $(CFLAGS) -c cmdline_getopts.cpp 

#build:  or simply like this
#	g++ $(CFLAGS) -o cmdline cmdline_getopts.cpp
clean:
	rm -f *.o cmdline_getopts  
