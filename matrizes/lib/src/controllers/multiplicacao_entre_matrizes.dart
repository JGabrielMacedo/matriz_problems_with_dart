import 'package:matrizes/src/models/matriz.dart';

class MultiplicacaoEntreMatrizesController {
  const MultiplicacaoEntreMatrizesController();

  bool matrizesPodemSerMultiplicadas(Matriz<int> matriz1, Matriz<int> matriz2) {
    if (matriz1[0].length != matriz2.length) {
      return false;
    }
    return true;
  }

  Matriz<int>? multiplicaMatrizes(Matriz<int> matriz1, Matriz<int> matriz2) {
    if (matriz1[0].length != matriz2.length) {
      print("Matrizes incompatíveis para multiplicação");
      return null;
    }

    Matriz<int> resultado = List.generate(
        matriz1.length, (i) => List.generate(matriz2[0].length, (j) => 0));

    for (int i = 0; i < matriz1.length; i++) {
      for (int j = 0; j < matriz2[0].length; j++) {
        for (int k = 0; k < matriz2.length; k++) {
          resultado[i][j] += matriz1[i][k] * matriz2[k][j];
        }
      }
    }

    return resultado;
  }
}
