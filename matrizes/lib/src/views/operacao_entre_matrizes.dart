import 'dart:io';

import 'package:matrizes/matrizes.dart';
import 'package:matrizes/src/controllers/operacao_entre_matrizes_controller.dart';
import 'package:matrizes/src/models/matriz.dart';

class OperacaoMatrizesView {
  final OperacaoMatrizesController controller;

  const OperacaoMatrizesView({
    this.controller = const OperacaoMatrizesController(),
  });

  void build() {
    while (true) {
      buildMenuView();
      final String? option = stdin.readLineSync();
      final int? intOption = int.tryParse(option ?? "");
      switch (intOption) {
        case 1:
          fazSomaEntreMatrizes();
          continue;
        case 2:
          fazSubtracaoEntreMatrizes();
          continue;
        case 3:
          fazMultiplicacaoDeUmaMatrizPorUmaConstante();
          continue;
        default:
          return;
      }
    }
  }

  void buildMenuView() {
    VisualHelper.faixa();
    print("Qual tipo de operação você deseja executar?");
    print("1 -> Soma entre matrizes");
    print("2 -> Subtração entre matrizes");
    print("3 -> Multiplicação de uma matriz por uma constante");
    print("0 -> Voltar");
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

  void fazSomaEntreMatrizes() {
    final List<int>? ordemDasMatrizes = recebeOrdemMatriz();
    if (ordemDasMatrizes == null) return;

    print("A seguir você irá inserir os valores da primeira matriz");
    print("");
    final Matriz<int>? matriz1 =
        recebeMatriz(ordemDasMatrizes.first, ordemDasMatrizes[1]);
    if (matriz1 == null) return;

    print("A seguir você irá inserir os valores da segunda matriz");
    print("");
    final Matriz<int>? matriz2 =
        recebeMatriz(ordemDasMatrizes.first, ordemDasMatrizes[1]);
    if (matriz2 == null) return;

    final Matriz<int>? resultado =
        controller.somaDuasMatrizes(matriz1: matriz1, matriz2: matriz2);

    if (resultado == null) {
      print("Sua matriz possui ordem errada");
      return;
    }

    print("A soma entre: ");
    VisualHelper.printaMatriz(matriz1);
    print("E a matriz:");
    VisualHelper.printaMatriz(matriz2);
    print("É igual a ");
    VisualHelper.printaMatriz(resultado);
  }

  void fazSubtracaoEntreMatrizes() {
    final List<int>? ordemDasMatrizes = recebeOrdemMatriz();
    if (ordemDasMatrizes == null) return;

    print("A seguir você irá inserir os valores da primeira matriz");
    print("");
    final Matriz<int>? matriz1 =
        recebeMatriz(ordemDasMatrizes.first, ordemDasMatrizes[1]);
    if (matriz1 == null) return;

    print("A seguir você irá inserir os valores da segunda matriz");
    print("");
    final Matriz<int>? matriz2 =
        recebeMatriz(ordemDasMatrizes.first, ordemDasMatrizes[1]);
    if (matriz2 == null) return;

    final Matriz<int>? resultado =
        controller.subtraiDuasMatrizes(matriz1: matriz1, matriz2: matriz2);

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

  void fazMultiplicacaoDeUmaMatrizPorUmaConstante() {
    final List<int>? ordem = recebeOrdemMatriz();
    if (ordem == null) return;

    final Matriz<int>? matriz = recebeMatriz(ordem.first, ordem[1]);
    if (matriz == null) return;

    print("Digite a constante que multiplicará sua matriz");
    final String? constanteStr = stdin.readLineSync();
    final int? constante = int.tryParse(constanteStr ?? "");

    if (constante == null) return;

    final Matriz<int> matrizCalculada = controller.multiplicaMatrizPorConstante(
      matriz: matriz,
      constante: constante,
    );

    print("Sua matriz multiplicada é:");
    VisualHelper.printaMatriz(matrizCalculada);
  }
}
