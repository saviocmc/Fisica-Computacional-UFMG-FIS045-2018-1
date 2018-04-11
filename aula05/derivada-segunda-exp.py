import numpy as N
import matplotlib.pylab as P

def f1(x):
    return N.exp(x)

def d2fdx(f,x,h):
    return (f(x+h)-2.*f(x) + f(x-h))/(h*h)

def main():
    x = 10.
    numero_de_passos = 20
    hs = N.zeros(numero_de_passos)
    f2 = N.zeros_like(hs)
    h_inicial = 0.1
    h = h_inicial
    for n in range (0,numero_de_passos):
 	hs[n] = h
	f2[n] = d2fdx(f1,x,h)
    	print x, N.log10(h), N.log10(N.abs((f2 - N.exp(x))/N.exp(x)))
 	h *= 0.5
    grafique(hs,f2,x)

def grafique(hs,f2,x):
    P.plot(N.log10(hs),N.log10(N.abs((f2 - N.exp(x))/N.exp(x))) )
    P.show()
