# Classe para trabalhar com numeros complexos
class Complex:

    # construtor da clase, cria um objeto do tipo Complex
    # self eh uma palavra reservada em python, e se refere ao objeto instanciado
	def __init__(self,x,y):
		self.re = x
		self.im = y

	def soma(self, other):
		return Complex(self.re + other.re , self.im + other.im)

	def subs(self,other):
		return Complex(self.re - other.re , self.im - self.im)

	def mult(self,other):
		return Complex(self.re*other.re - self.im*other.im,
				self.re*other.im + self.im*other.re )

	def __repr__(self):
		return '(%f, %f)' %(self.re, self.im)

print('Operacoes com dois numeros complexos')
z1 = Complex(2.,3.)
print ('z1 =' , z1)
z2 = Complex(4.,6.)
print ('z2 =' , z2)
z3 = Complex.soma(z1,z2)
print ('z1 + z2 =' , z3)
print ('z1 - z2 =' , Complex.subs(z1,z2))
print ('z1 * z2 =' , Complex.mult(z1,z2))

print ('aperte qualquer tecla para sair')
s = input()
