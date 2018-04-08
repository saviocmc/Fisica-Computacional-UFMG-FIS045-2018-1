! This program calculates the roots of cos(exp(x))'
program main
    implicit none
    real :: a, b, root, delta, i, f, bisection
    logical :: valid_range
    parameter(delta=1e-5)
    write(*,*) 'Please insert values of the initial interval'
    read(*,*) a, b
    if(.not.valid_range(a, b)) stop
    root = bisection(a, b, delta, i)
    write(*,*) 'Root is', root, 'with', i, 'iterations'
end program

real pure function f(x)
    real, intent(in) :: x
    f = cos(exp(x))
    return
end function

logical function valid_range(a, b)
    real, intent(in) :: a, b
    valid_range = .false.
    if(a>=b) then
        write(*,*) 'ERROR: final point must be greater than initial point'
        valid_range = .false.
    else if(f(a)*f(b)>0) then
        write(*,*) 'ERROR: the interval has no roots (or has an even number of roots)'
        valid_range = .false.
    else
        valid_range = .true.
    end if
    return
end function

real function bisection(a, b, delta, i)
    real :: a, b, delta, i
    real :: root
    i = 0
    if(abs(f(a))<delta) then
        root = a
    else if (abs(f(b))<delta) then
        root = b
    else
        do
            root = (b+a)/2
            write(*,*) 'partial root =', root
            if(abs(f(root))<delta) then
                exit
            else if(f(a)*f(root)<0) then
                b = root
            else
                a = root
            end if
            i=i+1
        end do
    end if
    bisection = root
    return
end function
