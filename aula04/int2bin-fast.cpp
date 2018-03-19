using namespace std;

#include <iostream>
#include <stdlib.h>

// Este programa tem exatamente o mesmo objetivo do programa "conversor-decimal-binario"
// mas realiza uma operação de comparação bit a bit ao invés de um cálculo de módulo
// e uma operação de deslocamento de bit ao invés de uma divisão.
// Como as operações utilizadas aqui são computacionalmente mais baratas, este programa é mais eficiente.
// Além disso, este programa funciona com inteiros negativos.
int main(int argc, char const *argv[]) {

	int decimal = atoi(argv[1]);
	bool binario[32];

	for(int i = 0; i < 32; i++){
		binario[i] = (decimal&1);
		cout << binario[i];
		decimal >>= 1;
	}

	cout << endl;
	return 0;
}
