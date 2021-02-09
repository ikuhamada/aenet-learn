 PROGRAM MAIN
!
! Lennard-Jones potential
!
 IMPLICIT NONE
! ... Data point ...
 INTEGER :: idt, ndt, mdt, ir, nr, mr
 REAL(KIND=8), ALLOCATABLE :: r(:), v(:)
! ... LJ parameters
 REAL(KIND=8) :: eps, r0
! ... Distance ...
 REAL(KIND=8) :: rmin, rmax, dr
 REAL(KIND=8) :: r12, r6
! ... Fortran I/O ...
 INTEGER :: stdin = 05, stdout = 06, stderr = 00, input = 10, iout = 20
 INTEGER :: ios, ierr
 CHARACTER(LEN=256) :: filen
! ... Command line arguments ...
 INTEGER :: iarg, iargc, narg
 CHARACTER(LEN=256) :: arg, arg2
!***********************************************************************
! ... LJ parameters
 eps = 3.607d0 ! eV
 r0 = 1.54d0   ! Angstrom
! ... Default values ...
 filen = 'v_lj.dat'
 rmin = 1.3D0
 rmax = 3.3D0
 mr = 2000
! ... Read command line arguments ...
 narg = iargc()
 iarg = 0
 DO 
   iarg = iarg + 1
   IF ( iarg > narg ) THEN
     EXIT
   ENDIF
   CALL getarg( iarg, arg ) 
   SELECT CASE( TRIM(arg) )
     CASE('-rmin')
       iarg = iarg + 1 
       CALL getarg( iarg, arg2 )
       READ( arg2, *, IOSTAT = ios ) rmin
       IF( ios /= 0 )THEN
         WRITE( stderr, '(A)' )&
&        '*** ERROR OCCURS WHILE READING THE COMMAND LINE ARGUMENTS.'
       ENDIF
     CASE('-rmax')
       iarg = iarg + 1 
       CALL getarg( iarg, arg2 )
       READ( arg2, *, IOSTAT = ios ) rmax
       IF( ios /= 0 )THEN
         WRITE( stderr, '(A)' )&
&        '*** ERROR OCCURS WHILE READING THE COMMAND LINE ARGUMENTS.'
       ENDIF
     CASE('-rmesh')
       iarg = iarg + 1 
       CALL getarg( iarg, arg2 )
       READ( arg2, *, IOSTAT = ios ) mr
       IF( ios /= 0 )THEN
         WRITE( stderr, '(A)' )&
&        '*** ERROR OCCURS WHILE READING THE COMMAND LINE ARGUMENTS.'
       ENDIF
     CASE('-o')
       iarg = iarg + 1 
       CALL getarg( iarg, arg2 )
       READ( arg2, '(A)', IOSTAT = ios ) filen
       IF( ios /= 0 )THEN
         WRITE( stderr, '(A)' )&
&        '*** ERROR OCCURS WHILE READING THE COMMAND LINE ARGUMENTS.'
       ENDIF
   END SELECT  
 ENDDO
 nr = mr + 1
 dr = ( rmax - rmin ) / DBLE( mr )
! ... Allocation ...
 ALLOCATE( r(nr), v(nr) )
! ... Calculate the LJ potential
 DO ir = 1, nr
   r(ir) = rmin + DBLE( ir -1 ) * dr
   r6 = ( r0 / r(ir) ) ** 6
   v(ir) = eps * ( r6 - 2.D0 ) * r6 
 ENDDO
 OPEN(iout,file=filen,status='unknown')
 DO ir = 1, nr
   WRITE(iout,'(F12.8,F12.8)') r(ir), v(ir)
 ENDDO
 CLOSE(iout)
 DEALLOCATE( r, v )
!***********************************************************************
 STOP
 END
