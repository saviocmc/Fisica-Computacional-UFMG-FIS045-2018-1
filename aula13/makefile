COMP= gfortran -O3 
RM= rm

matrix :        funcoes.o matrix.o
		${COMP} -o  matrix  funcoes.o matrix.o

funcoes.o :   funcoes.F90
		${COMP} -c  funcoes.F90


matrix.o :    matrix.F90
		${COMP} -c matrix.F90

clean: 		   
		${RM} ${PROG} *.o		   
