import 'package:matrizes/src/models/matriz.dart';

class OperacaoMatrizesController {
  const OperacaoMatrizesController();

  Matriz<int> multiplicaMatrizPorConstante({
    required Matriz<int> matriz,
    required int constante,
  }) {
    Matriz<int> matrizCalculada = [];
    for (var i = 0; i < matriz.length; i++) {
      matrizCalculada.add([]);
      for (var j = 0; j < matriz[i].length; j++) {
        matrizCalculada[i].add(matriz[i][j] * constante);
      }
    }

    return matrizCalculada;
  }

  Matriz<int>? somaDuasMatrizes({
    required Matriz<int> matriz1,
    required Matriz<int> matriz2,
  }) {
    final bool matrizesSaoDeMesmaOrdem = matriz1.length == matriz2.length &&
        matriz1.first.length == matriz2.first.length;

    if (!matrizesSaoDeMesmaOrdem) return null;

    Matriz<int> matrizCalculada = [];

    for (var i = 0; i < matriz1.length; i++) {
      matrizCalculada.add([]);
      for (var j = 0; j < matriz1.first.length; j++) {
        matrizCalculada[i].add(matriz1[i][j] + matriz2[i][j]);
      }
    }

    return matrizCalculada;
  }

  Matriz<int>? subtraiDuasMatrizes({
    required Matriz<int> matriz1,
    required Matriz<int> matriz2,
  }) {
    final bool matrizesSaoDeMesmaOrdem = matriz1.length == matriz2.length &&
        matriz1.first.length == matriz2.first.length;

    if (!matrizesSaoDeMesmaOrdem) return null;

    Matriz<int> matrizCalculada = [];

    for (var i = 0; i < matriz1.length; i++) {
      matrizCalculada.add([]);
      for (var j = 0; j < matriz1.first.length; j++) {
        matrizCalculada[i].add(matriz1[i][j] - matriz2[i][j]);
      }
    }

    return matrizCalculada;
  }
}
