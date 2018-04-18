program main
    implicit none
    real, allocatable, dimension(:,:) :: a, b, c
    integer :: n, k, i, j
    real :: pi, s, alpha
    character(len=10) :: format
    parameter(pi = 3.141592653589793)

    read(*,*) n
    allocate(a(n,n))
    allocate(b(n,n))
    allocate(c(n,n))
    s = n**(-0.5)

    do i=1, n
        do j=1, n
            a(i,j) = 0
            alpha = 2*pi*(i-1)*(j-1)*s
            b(i,j) = s*(sin(alpha)+cos(alpha))
            c(i,j) = b(i,j)
        end do
    end do

    do i=1, n
        do j=1, n
            do k=1, n
                a(i,j) = a(i,j) + b(i,k)*c(k,j)
            end do
        end do
    end do

    write (format, "(A1,I1,A6)") '(', n, 'F12.6)'
    write(*,*) 'Matriz B:'
    write(*,format) b
    write(*,*)
    write(*,*) 'Matriz C:'
    write(*,format) c
    write(*,*)
    write(*,*) 'Matriz A = BxC'
    write(*,format) a
    write(*,*)
    write(*,*) 'Matriz BxC com matmul:'
    write(*,format) matmul(b,c)

    deallocate(a,b,c)

end program