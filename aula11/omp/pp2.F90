program pp_omp_ex2
!Example of work replicated over the threads
Implicit none
!$omp parallel
write (6,*) 'Doing some stuff'
!$omp end parallel
end program pp_omp_ex2
