program main
    implicit none
    real, allocatable, dimension(:,:) :: a, b, c
    integer :: n, k, i, j
    real :: pi, s, alpha
    parameter(pi = 3.141592653589793)

    read(*,*) n
    allocate(a(n,n))
    allocate(b(n,n))
    allocate(c(n,n))
    s = n**(-0.5)

    !$omp parallel do
    do i=1, n
        do j=1, n
            alpha = 2*pi*(i-1)*(j-1)*s
            b(i,j) = s*(sin(alpha)+cos(alpha))
            c(i,j) = b(i,j)
        end do
    end do
    !$omp end parallel do

    !$omp parallel do
    do i=1, n
        do j=1, n
            a(i,j) = 0
            do k=1, n
                a(i,j) = a(i,j) + b(i,k)*c(k,j)
            end do
        end do
    end do
    !$omp end parallel do

    deallocate(a,b,c)

end program