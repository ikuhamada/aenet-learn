 program main
!
! Calculate the center of mass distance
!
 implicit none
 integer :: ii, jj, kk
 integer :: len
 real(kind=8) :: dist, dist_oo
 real(kind=8) :: car(3,6), com(3,2)
 character(len=2) :: c2
 character(len=256) :: str
 read(*,'(a)')str
!read(*,'(a)')str
 do ii = 1, 3
  read(*,'(a)')str 
  str = adjustl(str)
  len = index(str,' ')
  str = str(len+1:)
  write(*,'(a)')trim(str)
  read(str,*)car(:,ii)
 enddo
 do ii = 4, 6
  read(*,'(a)')str 
  str = adjustl(str)
  len = index(str,' ')
  str = str(len+1:)
  read(str,*)car(:,ii)
 enddo
 com(:,:) = 0.d0
 do ii = 1, 3
   com(:,1) = com(:,1) + car(:,ii)
 enddo
 com(:,1) = com(:,1)/3.d0
 do ii = 4, 6
   com(:,2) = com(:,2) + car(:,ii)
 enddo
 com(:,2) = com(:,2)/3.d0
 write(*,'(a,3f12.8)') 'COM #1      : ',com(:,1)
 write(*,'(a,3f12.8)') 'COM #2      : ',com(:,2)
 dist=0.d0
 do ii = 1, 3
   dist = dist + ( com(ii,1) - com(ii,2) ) ** 2
 enddo
 dist = sqrt(dist)
 write(*,'(a,f12.8)') 'COM DISTANCE : ',dist
 dist_oo = 0.d0
 do ii = 1, 3
   dist_oo = dist_oo + ( car(ii,1) - car(ii,4) ) ** 2
 enddo
 dist_oo = sqrt(dist_oo)
 write(*,'(a,f12.8)') 'O-O DISTANCE : ',dist_oo
 stop
 end
