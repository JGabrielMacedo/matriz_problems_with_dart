import 'dart:io';

import 'package:matrizes/matrizes.dart';
import 'package:matrizes/src/controllers/multiplicacao_entre_matrizes.dart';
import 'package:matrizes/src/models/matriz.dart';

class MultiEntreMatrizes {
  final MultiplicacaoEntreMatrizesController controller;

  const MultiEntreMatrizes({
    this.controller = const MultiplicacaoEntreMatrizesController(),
  });

  void build() {
    while (true) {
      buildMenuView();
      final String? option = stdin.readLineSync();
      final int? intOption = int.tryParse(option ?? "");
      switch (intOption) {
        case 1:
          fazMultiplicacaoEntreMatrizes();
          continue;
        default:
          return;
      }
    }
  }

  void buildMenuView() {
    VisualHelper.faixa();
    print("Multiplicação entre matrizes");
    print("1 -> Multiplicação entre matrizes");
    print("Qualquer outra coisa para sair");
    VisualHelper.faixa();
  }

  List<int>? recebeOrdemMatriz() {
    late int? linhasInt;
    while (true) {
      print("Digite o número de linhas da matriz");

      final String? linhas = stdin.readLineSync();
      linhasInt = int.tryParse(linhas ?? "");

      if (linhasInt != null) break;

      if (linhasInt == 0) return null;
    }

    print("");
    late int? colunasInt;
    while (true) {
      print("Digite o número de colunas");

      final String? colunas = stdin.readLineSync();
      colunasInt = int.tryParse(colunas ?? "");

      if (colunasInt != null) break;

      if (colunasInt == 0) return null;
    }

    return [linhasInt, colunasInt];
  }

  Matriz<int>? recebeMatriz(int numLinhas, int numColunas) {
    print(
        "Digite algo diferente de número para cancelar a captura de dados da matriz");
    print("");

    Matriz<int> matriz = List.generate(
      numLinhas,
      (index) => List.filled(numColunas, 0),
    );

    for (var i = 0; i < numLinhas; i++) {
      for (var j = 0; j < numColunas; j++) {
        print("Digite o valor para a posição [$i][$j]");
        final String? value = stdin.readLineSync();
        final valueInt = int.tryParse(value ?? "");
        if (valueInt == null) return null;

        matriz[i][j] = valueInt;
        VisualHelper.printaMatriz(matriz);
      }
    }

    return matriz;
  }

  void fazMultiplicacaoEntreMatrizes() {
    final List<int>? ordemDaMatriz1 = recebeOrdemMatriz();
    if (ordemDaMatriz1 == null) return;

    print("A seguir você irá inserir os valores da primeira matriz");
    print("");
    final Matriz<int>? matriz1 =
        recebeMatriz(ordemDaMatriz1.first, ordemDaMatriz1[1]);
    if (matriz1 == null) return;

    final List<int>? ordemDaMatriz2 = recebeOrdemMatriz();
    if (ordemDaMatriz2 == null) return;

    print("A seguir você irá inserir os valores da segunda matriz");
    print("");
    final Matriz<int>? matriz2 =
        recebeMatriz(ordemDaMatriz2.first, ordemDaMatriz2[1]);
    if (matriz2 == null) return;

    final Matriz<int>? resultado =
        controller.multiplicaMatrizes(matriz1, matriz2);

    if (resultado == null) {
      print("Sua matriz possui ordem errada");
      return;
    }

    print("A subtracao entre: ");
    VisualHelper.printaMatriz(matriz1);
    print("E a matriz:");
    VisualHelper.printaMatriz(matriz2);
    print("É igual a ");
    VisualHelper.printaMatriz(resultado);
  }
}
