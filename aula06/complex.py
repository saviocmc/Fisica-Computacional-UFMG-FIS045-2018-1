# Classe para trabalhar com numeros complexos
class Complex:

    #construtor da clase, cria um objeto do tipo Complex
	def __init__(z,x,y):
		z.re = x
		z.im = y

	def soma(z1, z2):
		return Complex(z1.re + z2.re , z1.im + z2.im)

	def subs(z1,z2):
		return Complex(z1.re - z2.re , z1.im - z2.im)

	def mult(z1,z2):
		return Complex(z1.re*z2.re - z1.im*z2.im,
				z1.re*z2.im + z1.im*z2.re )


	def __repr__(z):
		return '(%f, %f)' %(z.re, z.im)

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