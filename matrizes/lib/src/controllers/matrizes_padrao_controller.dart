import 'package:matrizes/src/models/matriz.dart';

class MatrizesEspeciaisController {
  Matriz<int> buildMatrizDiagonal(int ordem) {
    Matriz<int> matriz = [];
    for (var i = 1; i <= ordem; i++) {
      List<int> linha = <int>[];
      for (var j = 1; j <= ordem; j++) {
        if (j == i) {
          linha.add(ordem);
          continue;
        }
        linha.add(0);
      }
      matriz.add(linha);
    }
    return matriz;
  }

  Matriz<int> buildMatrizIdentidade(int ordem) {
    Matriz<int> matriz = [];
    for (var i = 1; i <= ordem; i++) {
      List<int> linha = <int>[];
      for (var j = 1; j <= ordem; j++) {
        if (j == i) {
          linha.add(1);
          continue;
        }
        linha.add(0);
      }
      matriz.add(linha);
    }
    return matriz;
  }

  Matriz<int> buildMatrizSimetrica(int ordem) {
    Matriz<int> matriz = [];
    for (var i = 1; i <= ordem; i++) {
      List<int> linha = <int>[];
      for (var j = 1; j <= ordem; j++) {
        linha.add(i + j);
      }
      matriz.add(linha);
    }
    return matriz;
  }

  Matriz<int> buildTranspostaDe(Matriz<int> matriz) {
    Matriz<int> transposta = List.generate(
      matriz[0].length,
      (index) => List.filled(matriz.length, 0),
    );

    for (var i = 0; i < matriz.length; i++) {
      for (var j = 0; j < matriz[i].length; j++) {
        transposta[j][i] = matriz[i][j];
      }
    }
    return transposta;
  }
}
