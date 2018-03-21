**2018-03-21** - Aula 05

## Derivação Numérica utilizando a Série de Taylor

* Discussão das fontes de erro quando o delta finito utilizado é muito pequeno
	* Erros quando a diferença entre pontos da função é menor que a resolução da variável utilizada

* Execução do programa [derivada-segunda-exp.f90](derivada-segunda-exp.f90) que calcula a derivada segunda da função exponencial *exp(x)* e calcula o erro relativo ao valor exato da derivada
* *Plot* dos error relativos em função da ordem de grandeza do valor do delta finito *h* utilizando o [GnuPlot](http://gnuplot.info)


## Extrapolação Numérica

* Extrapolação de Richardson
* Tarefa: desenvolver um programa que calcule os coeficientes da extrapolação de Richardson

## Programação em Python

* Características principais da linguagem
	* Expressiva, dinâmica, interpretada
* Vantagens
	* Simples e intuitiva
* Desvantagens
	* Execução lenta

* Operadores numéricos e lógicos em Python

* Introdução ao [Numpy](http://www.numpy.org) e ao [Matplotlib](https://matplotlib.org/)i

* Reescrita do programa que calcular a segunda derivada de *exp(x)* em Python: [derivada-segunda-exp.py](derivada-segunda-exp.py)
