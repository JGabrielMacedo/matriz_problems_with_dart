import 'dart:math';

import 'package:matrizes/src/models/matriz.dart';

class TeoremaDeLaplaceController {
  const TeoremaDeLaplaceController();

  double calculateDeterminanteLaplace(Matriz<double> matriz) {
    // Verifica se a matriz é quadrada
    if (matriz.length != matriz[0].length) {
      throw Exception('A matriz não é quadrada!');
    }

    // Caso base: matriz 1x1
    if (matriz.length == 1) {
      return matriz[0][0];
    }

    // Caso base: matriz 2x2
    if (matriz.length == 2) {
      return (matriz[0][0] * matriz[1][1]) - (matriz[0][1] * matriz[1][0]);
    }

    double det = 0;

    // Percorre a primeira linha da matriz
    for (int i = 0; i < matriz.length; i++) {
      // Calcula o cofator e o determinante da submatriz correspondente
      double cofator = pow(-1, i + 2) * matriz[0][i];
      Matriz<double> submatriz = List.generate(
        matriz.length - 1,
        (j) => List.generate(
          matriz.length - 1,
          (k) => matriz[j + 1][k < i ? k : k + 1],
        ),
      );
      double subdet = calculateDeterminanteLaplace(submatriz);

      // Soma o cofator multiplicado pelo determinante da submatriz ao determinante total
      det += cofator * subdet;
    }

    return det;
  }
}
