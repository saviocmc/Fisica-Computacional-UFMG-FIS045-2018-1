PROGRAM matrix
 USE constantes
 USE funcoes
 IMPLICIT NONE

 ! declaramos uma matriz
 REAL (DP), ALLOCATABLE, DIMENSION(:,:) :: a,ainv,unity
 REAL (DP) :: d
 INTEGER, ALLOCATABLE, DIMENSION(:) :: indx
 INTEGER :: n

 n=3
 ALLOCATE (indx(n))
 ALLOCATE (a(n,n), ainv(n,n), unity(n,n))
  a(1,1)=1. ; a(1,2)=3.; a(1,3)=4.
  a(2,1)=3. ; a(2,2)=4.; a(2,3)=6.
  a(3,1)=4. ; a(3,2)=6.; a(3,3)=8.

 WRITE(6,*) ' The matrix before inversion'
 WRITE(6,'(3F12.6)') a

! agora usamos a rotina lu_decompose em funcoes para 
! estimar a matriz decomposta
  ainv=a
  CALL matinv (ainv, n, d)
  WRITE(6,*) ' The determinant'
  WRITE(6,'(F12.6)') d
  WRITE(6,*) ' The matrix after inversion'
  WRITE(6,'(3F12.6)') ainv                                                                                                              
  !     calculamos a matriz unitaria
  unity=MATMUL(ainv,a)
  WRITE(6,*) ' The unity matrix'
  WRITE(6,'(3F12.6)') unity 
  !      desallocamos todos os arrays
  DEALLOCATE (a, ainv, unity)

END PROGRAM matrix
