program pp_omp_ex5
!Example of sections
!$ use omp_lib
implicit none
integer,parameter :: n=7
integer :: i,a(n),ta(n),b(n),tb(n),tid
!$omp parallel shared(a,ta,b,tb) private(i,tid)
!$omp sections
!$omp section
tid=0 !Dummy thread number, for the case OMP is not enabled
!$ tid=omp_get_thread_num()
do i=1,n
a(i)=2*i
ta(i)=tid !Record which thread did which iteration
enddo
!$omp section
tid=0 !Dummy thread number, for the case OMP is not enabled
!$ tid=omp_get_thread_num()
do i=1,n
b(i)=3*i
tb(i)=tid !Record which thread did which iteration
enddo
!$omp end sections
!$omp end parallel
!Show what was produced
write(6,*) 'i,a(i),thread that made a(i),b(i), thread that made b(i)'
do i=1,n
write(6,*) i,a(i),ta(i),b(i),tb(i)
enddo
end program pp_omp_ex5
