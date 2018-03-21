! programa para calcular a derivada segunda de exp(x)

MODULE constantes
! DEFINICAO DE VARIAVEIS
 INTEGER, PARAMETER :: dp = KIND(1.0D0)
 INTEGER, PARAMETER :: dpc = KIND((1.0D0,1.0D0))
END MODULE constantes

MODULE funcoes
 USE constantes
 IMPLICIT NONE
 CONTAINS
 
  SUBROUTINE derivada_segunda(numero_de_passos, x, passo_inicial, h_passo, &
         derivada_calculada)
   USE constantes
   INTEGER, INTENT(IN) :: numero_de_passos
   INTEGER :: contador
   REAL(DP), DIMENSION (numero_de_passos), INTENT(INOUT) :: derivada_calculada, h_passo
   REAL(DP), INTENT(IN) :: passo_inicial, x
   REAL(DP) :: h
 
   h = passo_inicial
   
   DO contador=1, numero_de_passos
    h_passo(contador) = h
    derivada_calculada(contador) = (EXP(x+h) - 2.*EXP(x) + EXP(x-h))/(h*h)
    h = h*0.5
   ENDDO
  END SUBROUTINE derivada_segunda
 
END MODULE funcoes

! programa principal

PROGRAM der2_exp
 USE constantes
 USE funcoes
 IMPLICIT NONE
 
! declaramos as variaveis necessarias
 INTEGER :: numero_de_passos, contador
 REAL(DP) :: x, passo_inicial, derivada_exata
 REAL(DP), ALLOCATABLE, DIMENSION(:) :: h_passo, derivada_calculada
 REAL(DP), ALLOCATABLE, DIMENSION(:) :: erro
 
! pergunte em tela algumas quantidades
 WRITE(*,*) "  escreva os valores de: passo_inicial, x, e o numero de passos " 
 READ(*,*) passo_inicial, x, numero_de_passos
 
! criamos um arquivo de saida
 OPEN(UNIT=7,FILE='dados.dat')
 ALLOCATE(h_passo(numero_de_passos),derivada_calculada(numero_de_passos))
 ALLOCATE(erro(numero_de_passos))

! agora calculamos a derivada, comecamos colocando 0's nas variaveis
 h_passo = 0.0_dp; derivada_calculada = 0.0_dp
 CALL derivada_segunda(numero_de_passos, x, passo_inicial, h_passo, derivada_calculada)
 
! finalmente escrevemos os resutados
 derivada_exata = EXP(x)
 DO contador=1, numero_de_passos
  erro(contador) = LOG10(ABS((derivada_calculada(contador)-derivada_exata)/derivada_exata))
  WRITE(7,'(E16.9,2X,E16.9,2X,E16.9)') LOG10(h_passo(contador)),derivada_calculada(contador), &
                                       erro(contador)
 ENDDO

! e liberamos memoria
 DEALLOCATE( h_passo, derivada_calculada)
! fechamos o arquivo de saida
 CLOSE(7)
 
END PROGRAM der2_exp

  
