import math
#import matplotlib.pyplot as plt

# Classe para trabalhar com numeros complexos
class Complex:

    # construtor da clase, cria um objeto do tipo Complex
    # self eh uma palavra reservada em python, e se refere ao objeto instanciado
	def __init__(self,x,y):
		self.re = x
		self.im = y

	def __add__(self, other):
		return Complex(self.re + other.re , self.im + other.im)

	def __sub__(self,other):
		return Complex(self.re - other.re , self.im - self.im)

	def __mul__(self,other):
		return Complex(self.re*other.re - self.im*other.im,
				self.re*other.im + self.im*other.re)

	def __repr__(self):
		return '(%f, %f)' %(self.re, self.im)

	def abs(self):
		return math.sqrt(math.pow(self.re,2)+math.pow(self.im,2))


z1 = Complex(3,4)
print(z1.abs())

#Classe que representa um circuito RLC
class CircuitRLC:

    def __init__(self, R, L, C):
        self.R = R # Resistência em ohms [R]
        self.L = L # Indutância em henri [H]
        self.C = C # Capacitância em farad [F]

    def Z(self, w):
        return Complex(self.R, (1/(w*self.C) - w*self.L))

    def Imax(self, V, w):
        return V / self.Z(w).abs()

    def phase(self, w):
        return math.atan((1/(w*self.C) - w*self.L)/self.R)

    def I(self, V, w, t):
        return self.Imax(V, w) * math.cos(w*t + self.phase(w))

circuit = CircuitRLC(200,1000,1e-3)

print(circuit.I(1,2,3))