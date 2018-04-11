program main
    real :: integral_f, integral_trapezio_f, integral_simpson_f
    real :: a, b
    integer :: N
    write(*,*) 'Insira o valor do limite inferior, do limite superior'
    write(*,*) 'e do número N de pontos a serem avaliados'
    read(*,*) a, b, N
    if(mod(N,2)==0) then
      write(*,*) 'O valor de N deve ser ímpar para a Regra de Simpson funcionar'
      stop
    end if
    write(*,*) 'Valor exato', integral_f(a, b)
    write(*,*) 'Regra do trapézio', integral_trapezio_f(a, b, N)
    write(*,*) 'Regra de Simpson', integral_simpson_f(a, b, N)
end program

real function f(x)
    real, intent(in) :: x
    f=exp(-x)
    !f=x**2
    return
end function

real function integral_f(a, b)
    real, intent(in) :: a, b
    integral_f = -exp(-b) + exp(-a)
    !integral_f = ((b**3)-(a**3))/3
    return
end function

real function integral_trapezio_f(a, b, N)
    real, intent(in) :: a, b
    integer, intent(in) :: N
    real :: h
    h = (b-a)/(N-1)
    integral_trapezio_f = (f(a)+f(b))*h/2
    do i=1, (N-2)
        integral_trapezio_f = integral_trapezio_f + h*f(a+h*i)
    end do
    return
end function

real function integral_simpson_f(a, b, N)
    real, intent(in) :: a, b
    integer, intent(in) :: N
    real :: h
    h = (b-a)/(N-1)
    integral_simpson_f = (f(a)+f(b))*h
    do i=1, (N-2)
        integral_simpson_f = integral_simpson_f + h*f(a+h*i)*ishft(2,(AND(i,1)))
        ! A expressão ishft(2,(AND(i,1))) retorna 2 se i for par e 4 se i for ímpar
        ! que é o peso para cada termo da soma da regra de Simpson
    end do
    ! do i=0, (N-3)/2
    !     integral_simpson_f = integral_simpson_f + 4*h*f(a+h*(1+2*i))
    ! end do
    ! do i=1, (N-3)/2
    !     integral_simpson_f = integral_simpson_f + 2*h*f(a+h*(2*i))
    ! end do
    integral_simpson_f = integral_simpson_f/3
    return
end function