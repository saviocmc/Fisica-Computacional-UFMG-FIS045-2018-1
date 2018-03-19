**2018-03-14** - Aula 03

## Estrutura de programas em C++, Fortran e Python

  * **Fortran**
    * `` PROGRAM something ``
    * `` FUNCTION something(input)``
    * `` SUBROUTINE something(input)``

  * **C++**
    * `` int main() ``
    * `` double something(int input) ``


## Tipos de dados em C++ e Fortran

  * Números reais no sistema binário
  * Apresentação dos tipos de dados e seus respectivos ranges de valores
  * Discussão sobre representação binária dos números inteiros
  * Conversão da representação de números inteiros entre o sistema decimal e o binário
  * Discussão de *Overflow* em variáveis inteiras:
  * Introdução às variáveis Reais:
    * Fortran: REAL(4), REAL(8)
    * C++: float, double, long double
    * Bit de sinal, expoente e mantisa

## Mãos à obra

  * Escrita, compilação e execução do programa [hello.f90](hello.f90) em Fortran que calcula e imprime o seno de um dado número
  * Escrita e execução do programa [hello.py](hello.py) em Python que equivalente ao programa anterior em Fortran, que calcula também o cosseno
  * Execução de programa que evidencia os casos de *overflow* de variáveis inteiras em Fortran
