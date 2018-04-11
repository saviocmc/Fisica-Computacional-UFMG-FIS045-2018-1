program pp_omp_ex4
!Example of a parallel loop
!$ use omp_lib
implicit none
integer,parameter :: n=7
integer :: i,a(n),t(n),tid
!$omp parallel shared(a,t) private(i,tid)
tid=0 !Dummy thread number, for the case OMP is not enabled
!$ tid=omp_get_thread_num()
!$omp do
do i=1,n
 a(i)=2*i
 t(i)=tid !Record which thread did which iteration
enddo
!$omp end do
!$omp end parallel
!Show what was produced
write(6,*) 'i,a(i),thread number'
do i=1,n
 write(6,*) i,a(i),t(i)
enddo
end program pp_omp_ex4
