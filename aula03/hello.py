import math

def hello(name):
    print("Olá, ", name)

name = input("Digite seu nome: ")

hello(name)

r = float(input("\nDigite um númetro real: "))

s = math.sin(r)
c = math.cos(r)
print("O seno de ", r , " é ", s)
print("O cosseno de ", r , " é ", c)

