! Este programa tem exatamente o mesmo objetivo do programa "int2bin.f90"
! mas realiza uma operação de comparação bit a bit ao invés de um cálculo de módulo
! e uma operação de deslocamento de bit ao invés de uma divisão.
! Como as operações utilizadas aqui são computacionalmente mais baratas, este programa é mais eficiente.
! Além disso, este programa funciona com inteiros negativos.

PROGRAM int2bin

  ! Declaração das variáveis
  IMPLICIT NONE
  INTEGER(KIND=4) :: input, index

  WRITE(*,*) "Insira um númetro inteiro para ser convertido"
  READ(*,*) input

  ! Converte o valor em binário e imprime o resultado na saída pradrão
  DO index=1,32
    WRITE(*,*) AND(input, 1)
    input = RSHIFT(input, 1)
  END DO

END PROGRAM int2bin