import 'package:matrizes/src/models/matriz.dart';

import 'matrizes_padrao_controller.dart';

class FormulasEspecificasConstroller {

  Matriz<int> calculaPri() {
    Matriz<int> matriz = [];
    for (var i = 0; i < 3; i++) {
      matriz.add([]);
      for (var j = 0; j < 2; j++) {
        if (i == j) {
          matriz[i].add((3 * (i + 1)) + (2 * (j + 1)));
          continue;
        }
        if (i != j) {
          matriz[i].add((4 * (i + 1)) - (3 * (j + 1)));
          continue;
        }
      }
    }

    return matriz;
  }

  Matriz<int> calculaSeg() {
    Matriz<int> matriz = [];
    for (var i = 0; i < 4; i++) {
      matriz.add([]);
      for (var j = 0; j < 4; j++) {
        if (i == j) {
          matriz[i].add((i + 1) * (j + 1));
          continue;
        }
        if (i > j) {
          matriz[i].add(((i + 1) ^ 2) + (3 * (j + 1)));
          continue;
        }
        if (i < j) {
          matriz[i].add(((i + 1) * 5) - ((j + 1) ^ 2));
          continue;
        }
      }
    }
    return matriz;
  }

  Matriz<int> calculaTer() {
    Matriz<int> matriz = [];
    for (var i = 0; i < 6; i++) {
      matriz.add([]);
      for (var j = 0; j < 1; j++) {
        if (i == j) {
          matriz[i].add(3);
          continue;
        }
        if (i != j) {
          matriz[i].add(2 - (i + 1));
          continue;
        }
      }
    }
    return matriz;
  }

  Matriz<int> calculaQuar() {
    Matriz<int> matriz = [];
    for (var i = 0; i < 3; i++) {
      matriz.add([]);
      for (var j = 0; j < 3; j++) {
        if (i == j) {
          matriz[i].add((2 * (i + 1)) - ((j + 1) * 4));
          continue;
        }
        if (i > j) {
          matriz[i].add((i + 1) ^ 2);
          continue;
        }
        if (i < j) {
          matriz[i].add((j + 1) ^ 2);
          continue;
        }
      }
    }
    return matriz;
  }

  Matriz<int> geraMatriz(int linha, int coluna) {
    Matriz<int> matriz = [];
    for (var i = 0; i < linha; i++) {
      matriz.add([]);
      for (var j = 0; j < coluna; j++) {
        matriz[i].add(0);
      }
    }
    return matriz;
  }
}
