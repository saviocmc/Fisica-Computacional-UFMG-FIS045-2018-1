**2018-03-19** - Aula 04

## Tarefa prática

* Escrita de programa em Fortran que recebe como entrada um número inteiro no sistema decimal e em seguida calcula e mostra sua representação no sistema binário
	* [int2bin.f90](int2bin.f90): Implementação utilizando o algoritmo visto em sala utilizando a função *MOD* (módulo).
	* [int2bin-fast.f90](int2bin-fast.f90): Implementação com melhor desempenho que fiz utilizando comparação bit a bit *AND* e a operação de deslocamento de bit *RSHIFT*


## Diferenciação numérica
* Bases teórica da diferenciação utilizando delta finito
* Discussão das fontes de erro na diferenciação e suas ordem de grandeza em função do grau da função a ser diferenciada
* Melhores métodos com menor ordem de erro
* Execução de um programa em Fortran que calcula a derivada da função exponencial *epx(x)* utilizando diferentes algorítimos e análise dos resultados.
