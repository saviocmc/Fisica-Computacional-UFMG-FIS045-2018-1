using namespace std;

#include <iostream>
#include <stdlib.h>

// Este programa deve receber um número inteiro de 4 bytes (-2147483648 a 2147483647)
// como argumento de entrada e imprimir na saída padrão a representação binária desse inteiro
int main(int argc, char const *argv[]) {

	int decimal = atoi(argv[1]);
	int binario[32];

	for(int i = 0; i < 32; i++) {
		binario[i] = decimal%2;
		cout << binario[i];
		decimal = decimal/2;
	}

	cout << endl;
	return 0;
}
