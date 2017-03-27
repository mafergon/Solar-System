      program sistsol
      

      implicit none
      integer i, j, n
      parameter (n=10)
      real*8 pos(1:n,2), vel(1:n,2), a(1:n,2),m(1:n)
      real*8 tmax, h, t, mod, ene, const1, const2, aux1,aux2
      common pos, vel, a, m, tmax, h, t, mod, ene, const1, const2, i
      
      
      call datos


      call aceleracion

      aux1=pos(4,1)
      aux1=aux1+0.001
      aux2=aux1-0.002

      do while (t.lt.tmax)

         call posicion
         
         call aceleracion

         call velocidad
         
         call etot
        
         call momlin

         call momang
         
         t=t+h

      enddo


      close (10)
      close (11)
      close (12)
      close (13)
      close (14)
      close (15)
      close (16)
      close (17)

      end


      subroutine aceleracion
      
      implicit none
      integer i, j, n
      parameter (n=10)
      real*8 pos(1:n,2), vel(1:n,2), a(1:n,2),m(1:n)
      real*8 tmax, h, t, mod, ene, const1, const2
      common pos, vel, a, m, tmax, h, t, mod, ene, const1, const2, i
      
      

      do i=1,n
         a(i,1)=0
         a(i,2)=0
      enddo

      do i=1,n-1
         do j=i+1,n
             mod=dsqrt((pos(i,1)-pos(j,1))**2+(pos(i,2)-pos(j,2))**2)**3
               a(i,1)=a(i,1)-(m(j)*(pos(i,1)-pos(j,1)))/mod
               a(i,2)=a(i,2)-(m(j)*(pos(i,2)-pos(j,2)))/mod
               a(j,1)=a(j,1)-(m(i)*(pos(j,1)-pos(i,1)))/mod
               a(j,2)=a(j,2)-(m(i)*(pos(j,2)-pos(i,2)))/mod
         enddo
      enddo

      return

      end

      subroutine posicion
      
      implicit none
      integer i, j, n
      parameter (n=10)
      real*8 pos(1:n,2), vel(1:n,2), a(1:n,2),m(1:n)
      real*8 tmax, h, t, mod, ene, const1, const2
      common pos, vel, a, m, tmax, h, t, mod, ene, const1, const2, i

      do i=1,n
         pos(i,1)=pos(i,1)+h*vel(i,1)+const2*a(i,1)
         pos(i,2)=pos(i,2)+h*vel(i,2)+const2*a(i,2)
         vel(i,1)=vel(i,1)+const1*a(i,1)
         vel(i,2)=vel(i,2)+const1*a(i,2)
      enddo

      return

      end

      subroutine velocidad

      implicit none
      integer i, j, n
      parameter (n=10)
      real*8 pos(1:n,2), vel(1:n,2), a(1:n,2),m(1:n)
      real*8 tmax, h, t, mod, ene, const1, const2
      common pos, vel, a, m, tmax, h, t, mod, ene, const1, const2, i


      do i=1,n
         vel (i,1)=vel(i,1)+const1*a(i,1)
         vel (i,2)=vel (i,2)+const1*a(i,2)
         write (17,*) pos(i,1)
         write (17,*) pos(i,2)
      enddo


      return
      
      end

      subroutine etot

      implicit none
      integer i, j, n
      parameter (n=10)
      real*8 pos(1:n,2), vel(1:n,2), a(1:n,2),m(1:n)
      real*8 tmax, h, t, mod, ene
      common pos, vel, a, m, tmax, h, t, mod, ene, i

      
      ene=0
      
      do i=1,n-1
         ene=ene+m(i)*0.5*(vel(i,1)**2+vel(i,2)**2)
         do j=i+1,n
               mod=dsqrt((pos(i,1)-pos(j,1))**2+(pos(i,2)-pos(j,2))**2)
               ene=ene-(m(i)*m(j)/mod)
         enddo 
      enddo
      ene=ene+m(n)*0.5*(vel(n,1)**2+vel(n,2)**2)
     
      write(14,*) t,ene
      return
      
      end

      subroutine momlin

      implicit none
      integer i, j, n
      parameter (n=10)
      real*8 pos(1:n,2), vel(1:n,2), a(1:n,2),m(1:n)
      real*8 tmax, h, t, mod, ene
      common pos, vel, a, m, tmax, h, t, mod, ene, i
      
      ene=0
      
      do i=1,n
            ene=ene+m(i)*dsqrt(vel(i,1)**2+vel(i,2)**2)
         enddo

         write(15,*) t, ene
            
      return
      
      end

      subroutine momang

      implicit none
      integer i, j, n
      parameter (n=10)
      real*8 pos(1:n,2), vel(1:n,2), a(1:n,2),m(1:n)
      real*8 tmax, h, t, mod, ene
      common pos, vel, a, m, tmax, h, t, mod, ene, i
      
      ene=0
      
      
      do i=1,n
         ene=ene+m(i)*(pos(i,1)*vel(i,2)-pos(i,2)*vel(i,1))
         enddo

         write(16,*) t, ene

         
      return
      
      end

      subroutine datos

      implicit none
      integer i, j, n
      parameter (n=10)
      real*8 pos(1:n,2), vel(1:n,2), a(1:n,2),m(1:n)
      real*8 tmax, h, t, mod, ene, const1, const2
      common pos, vel, a, m, tmax, h, t, mod, ene, const1, const2, i

      open (10, file ='masa.txt', status='old')
      open (11,file='posicion.txt', status='old')
      open(12, file='velocidad.txt', status='old')
      open(13, file='param.txt', status='old')
      open(14, file='energia.txt', status='replace')
      open(15, file='momlin.txt',status='replace')
      open(16, file='momang.txt',status='replace')
      open(17, file='output.txt',status='replace')

      do i=1,n
         read(10,*) m(i)
         read(11,*) pos(i,1), pos(i,2)
         read(12,*) vel(i,1), vel(i,2)
      enddo

      read(13,*) tmax, h

      const1=h*0.5
      const2=h**2*0.5
      
      return
      
      end

      
      
         
   
      

      

      
