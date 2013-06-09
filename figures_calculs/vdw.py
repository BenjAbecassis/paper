from scipy	import *
from matplotlib import *
from pylab import *
from math import *

k = 1.381e-23
T = 298
A_np = 11e-20
print(A_np/(k*T))

def K6(l,a):
	term1 = 2*((a*l**2+2*a**3)/(2*l**4*sqrt(l**2+a**2))*atan(a/(sqrt(l**2+a**2))))
	term2 = 2*a/l**3*atan(a/l)
	return term1-term2

def E_vdw(A,e,l,a):
	return -A*e**2/pi**2*K6(l,a)

l=[1.0*i for i in range(1,50,1000)]

figure(1)
plot(l,[E_vdw(1.87e-20/(k*T),1,x,10) for x in l],'r-')
xlabel('Separation l (nm)')
ylabel('Interaction energy (kT)')
show()