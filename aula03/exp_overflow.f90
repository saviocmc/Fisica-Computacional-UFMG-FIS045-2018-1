! Este programa deve receber um número inteiro n
! e realizar os cálculos descritos na pag. 15 da apresetação do professor
! http://lilith.fisica.ufmg.br/~guerrero/notas-fis045/cap01.pdf
PROGRAM exp_over

  IMPLICIT NONE
  INTEGER :: n, n2

  WRITE(*,*) "Introduza um número interiro n"
  READ(*,*) n ! Lê o número digitado no terminal e o salva na variável n
  n2 = 2**n ! Calcula o valor de 2^n e o salva na variável n2
  WRITE(*,*) "2^n = ", n2
  WRITE(*,*) "2^n*2^n = ", n2*n2
  WRITE(*,*) "2^n*(2^n-1) = ", n2*(n2-1)
  WRITE(*,*) "2^n-1 = ", n2-1

END PROGRAM exp_over

