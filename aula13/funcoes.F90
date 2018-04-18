MODULE constantes
  ! definicao de variaveis para precisao dupla
  INTEGER,  PARAMETER :: dp = KIND(1.0D0)
  INTEGER, PARAMETER :: dpc = KIND((1.0D0,1.0D0))
  ! Parametro de truncamento
  REAL(DP), PARAMETER, PUBLIC ::  truncamento=1.0E-10
END MODULE constantes

! modulo com funcoes para resolver sistemas lineares de equacoes

MODULE funcoes
 USE constantes
 CONTAINS

! rutina para invertir uma matriz

  SUBROUTINE matinv(a,n,d)                                                                                                              
    IMPLICIT NONE
    INTEGER, INTENT(IN) :: n
    INTEGER :: i, j
    REAL(DP), DIMENSION(n,n), INTENT(INOUT)  :: a
    REAL(DP), ALLOCATABLE :: y(:,:)
    REAL(DP) :: d
    INTEGER, ALLOCATABLE :: indx(:)

    ALLOCATE (y( n, n))  ; ALLOCATE ( indx (n))
    y=0.
    !    matriz identidade
    DO i=1,n
       y(i,i)=1.
    ENDDO
    !     fazemos a decomposicao LU
    CALL  lu_decompose(a,n,indx,d)

    !     Encontramos o inverso resolvendo um sistema 
    DO j=1,n
       CALL lu_linear_equation(a,n,indx,y(:,j))
    ENDDO
    !     The original matrix a was destroyed, now we equate it with the inverse y 
    a=y

    DEALLOCATE ( y ); DEALLOCATE ( indx )

  END SUBROUTINE matinv
!
  !     Dada uma matriz NxN  A(N,N), essa rutina a troca pela sua 
  !     decomposicao LU com os elementos da decomposicao armazenados
  !     na mesma matriz A.
  !     O array indx eh um vetor de saida que armazena 
  !     as permutacoes de fila que sao afetadas por pivoting
  !     d, eh o determinante
  !
  SUBROUTINE lu_decompose(a,n,indx,d)
    IMPLICIT NONE
    INTEGER :: n, i, j, k, imax
    REAL(DP) :: sum , tiny, aamax, dum, d
    REAL(DP), DIMENSION(n,n) :: a
    INTEGER, DIMENSION(n) :: indx
    REAL(DP), ALLOCATABLE :: vv(:)

    tiny=1.0e-20
    ALLOCATE ( vv(n) )
    D=1.
    DO i=1,n
       aamax=0.
       DO j=1,n
          IF (ABS(a(i,j)) > aamax) aamax=ABS(a(i,j))
       ENDDO
       !  Maior elemento eh zero    
       IF (aamax == 0.) STOP 'Singular matrix.'
       !  Sem zero como o maior elemento     
       vv(i)=1./aamax
    ENDDO
    !     loop sob colunas
    DO j=1,n
       !     Resolve  2.3.12 exceto para i=j de Numerical Recipes
       IF (j > 1) THEN
          DO i=1,j-1
             sum=a(i,j)
             IF (i > 1)THEN
                DO k=1,i-1
                   sum=sum-a(i,k)*a(k,j)
                ENDDO
                a(i,j)=sum
             ENDIF
          ENDDO
       ENDIF
       !   procura pelo maior elemento de pivote
       aamax=0.
       DO i=j,n
          sum=a(i,j)
          IF (j > 1)THEN
             DO k=1,j-1
                sum=sum-a(i,k)*a(k,j)
             ENDDO
             a(i,j)=sum
          ENDIF
          dum=vv(i)*ABS(sum)
          IF (dum >= aamax) THEN
             imax=i
             aamax=dum
          ENDIF
       ENDDO
       !    intercambio de filas
       IF (j /= imax)THEN
          DO k=1,n
             dum=a(imax,k)
             a(imax,k)=a(j,k)
             a(j,k)=dum
          ENDDO
          !   mudanca de paridade do determinante 
          d=-d
          vv(imax)=vv(j)
       ENDIF
       !     resolve a equacao 2.3.13 
       indx(j)=imax
       IF(j /= n) THEN
          IF(a(j,j) == 0.) a(j,j)=tiny
          dum=1./a(j,j)
          DO i=j+1,n
             a(i,j)=a(i,j)*dum
          ENDDO
       ENDIF
       !    o  determinante fica
       d=d*a(j,j)
    ENDDO
    IF(a(n,n) == 0.)  a(n,n)=tiny
    DEALLOCATE ( vv)

  END SUBROUTINE lu_decompose



  !     Solves set of linear equations Ax=b, A is input as an LU decompomsed
  !     matrix and indx keeps track of the permutations of the rows. b is input
  !     as the right-hand side vector b and returns the solution x. A, n and indx
  !     are not modified by this routine. This function takes into that b can contain
  !     many zeros and is therefore suitable for matrix inversion


  SUBROUTINE lu_linear_equation(a,n,indx,b)
    IMPLICIT NONE
    INTEGER :: n, ii, ll, i, j
    REAL(DP) :: sum
    REAL(DP), DIMENSION(n,n) :: a
    REAL(DP), DIMENSION(n) :: b
    INTEGER, DIMENSION(n) :: indx

    ii=0
    !     First we solve equation 2.3.6 of numerical recipes 
    DO i=1,n
       ll=indx(i)
       sum=b(ll)
       b(ll)=b(i)
       IF (ii /= 0)THEN
          DO j=ii,i-1
             sum=sum-a(i,j)*b(j)
          ENDDO
       ELSEIF (sum /= 0.) THEN
          ii=i
       ENDIF
       b(i)=sum
    ENDDO
    !     then we solve equation 2.3.7
    DO i=n,1,-1
       sum=b(i)
       IF (i < n) THEN
          DO j=i+1,n
             sum=sum-a(i,j)*b(j)
          ENDDO
       ENDIF
       !     store a component of the solution x in the same place as b
       b(i)=sum/a(i,i)
    ENDDO

  END SUBROUTINE lu_linear_equation


  ! takes as input x[1,..,n] and y[1,..,n] containing a tabulation
  ! y_i = f(x_i) with x_0 < x_1 < .. < x_(n - 1) 
  ! together with yp_1 and yp2 for first derivatives  f(x) at x_0 
  ! and x_(n-1), respectively. Then the
  ! function returns y2[1,..,n] which contains the second 
  ! derivatives of f(x_i)at each point x_i. If yp1 and/or yp2 
  ! is larger than the constant INFINITY the function will 
  ! put corresponding second derivatives to zero.

  SUBROUTINE spline(x,y,n,yp1,ypn,y2)
    IMPLICIT NONE
    INTEGER :: i, k, n
    REAL(DP), DIMENSION(n) :: x, y, y2
    REAL(DP), DIMENSION(:), ALLOCATABLE :: u
    REAL(DP) :: p, qn, sig, un, ypn, yp1 

    ALLOCATE ( u (n) )
    IF (yp1 > .99E30) THEN
       y2(1)=0.
       u(1)=0.
    ELSE
       y2(1)=-0.5
       u(1)=(3./(x(2)-x(1)))*((y(2)-y(1))/(x(2)-x(1))-yp1)
    ENDIF
    DO i=2,n-1
       sig=(x(i)-x(i-1))/(x(i+1)-x(i-1))
       p=sig*y2(i-1)+2.
       y2(i)=(sig-1.)/p
       u(i)=(6.*((y(i+1)-y(i))/(x(i+1)-x(i))-(y(i)-y(i-1)) &
            /(x(i)-x(i-1)))/(x(i+1)-x(i-1))-sig*u(i-1))/p
    ENDDO
    IF (ypn > .99E30) THEN
       qn=0.
       un=0.
    ELSE
       qn=0.5
       un=(3./(x(n)-x(n-1)))*(ypn-(y(n)-y(n-1))/(x(n)-x(n-1)))
    ENDIF
    y2(n)=(un-qn*u(n-1))/(qn*y2(n-1)+1.)
    DO k=n-1,1,-1
       y2(k)=y2(k)*y2(k+1)+u(k)
    ENDDO
    DEALLOCATE ( u )

  END SUBROUTINE spline


  ! takes xa[1,..,n] and y[1,..,n] which tabulates a function 
  ! (with the xa[i]'s in order) and given ya[0,..,n - 1], 
  ! which is the output from function spline() and with 
  ! given value of x returns a cubic--spline interpolation value y.

  SUBROUTINE splint(xa,ya,y2a,n,x,y)
    IMPLICIT NONE
    INTEGER :: k, n, klo, khi
    REAL(DP), DIMENSION(n) :: xa, ya, y2a
    REAL(DP) ::  x, y, h, b, a

    klo=1
    khi=n
    DO WHILE  (khi-klo > 1)
       k=(khi+klo)/2
       IF(xa(k)  > x)THEN
          khi=k
       ELSE
          klo=k
       ENDIF
    ENDDO
    h=xa(khi)-xa(klo)
    IF (h == 0.) WRITE (6,*) 'Bad XA input in SPLINT.F.'
    a=(xa(khi)-x)/h
    b=(x-xa(klo))/h
    y=a*ya(klo)+b*ya(khi)+ &
         ((a**3-a)*y2a(klo)+(b**3-b)*y2a(khi))*(h**2)/6.

  END SUBROUTINE splint

END MODULE funcoes


