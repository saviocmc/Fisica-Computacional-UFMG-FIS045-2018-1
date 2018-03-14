! Este programa deve ler um valor numérico (decimal, real) da entrada padrão
! e imprimir na saída padrão o seno deste valor

PROGRAM hello

	IMPLICIT NONE
	REAL(KIND=8) :: r, s
	WRITE(*,*) "Olá mundo!"

    ! Pedir para um número ser digitado
	WRITE(*,*) "Digite um número real: "
	READ(*,*) r
	s = sin(r);
	WRITE(*,*) "O seno de ", r , " é ", s

END PROGRAM hello

