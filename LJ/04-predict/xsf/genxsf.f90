 program main
 implicit none
 integer :: i, n
 real(kind=8) :: xmin, xmax, dx, x
 character(len=5) :: c5
 character(len=256) :: prefx, filen
 n = 300
 xmin = 1.0
 xmax = 4.0
 dx = ( xmax - xmin ) / dble(n)
 do i = 1, n + 1
   x = xmin + dble( i-1 ) * dx
   write(c5,'(i3.3)')i 
   filen='structure_'//trim(c5)//'.xsf'
   open(10,file=filen,status='unknown')
   write(10,'(a)')'ATOMS'
   write(10,'(a,3f20.10)')' C',0.0,0.0,0.0
   write(10,'(a,3f20.10)')' C',x,0.0,0.0
   close(10)
 enddo
 stop
 end
