program pp_omp_ex1
!Generic example of the look of an OMP program
implicit none
integer, parameter :: n=1000
integer :: i,a(n)
!$omp parallel do shared(a) private(i)
do i=1,n
 a(i)=i
enddo
!$omp end parallel do
end program pp_omp_ex1
