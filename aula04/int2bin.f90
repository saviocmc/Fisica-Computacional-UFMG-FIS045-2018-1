! Este programa deve receber um número input de 4 bytes (-2147483648 a 2147483647)
! como argumento de entrada e imprimir na saída padrão a representação binária desse input

PROGRAM int2bin

  ! Declaração das variáveis
  IMPLICIT NONE
  INTEGER(KIND=4) :: input, index
  ! Array no qual será armazenada a representação binário do input
  INTEGER :: repreBinaria(32)

  WRITE(*,*) "Insira um númetro input para ser convertido"
  READ(*,*) input

  ! Converte o valor em binário e imprime o resultado na saída pradrão
  DO index=1,32
    repreBinaria(index) = MOD(input, 2)
    WRITE(*,*) repreBinaria(index)
    input = input/2
  END DO

END PROGRAM int2bin