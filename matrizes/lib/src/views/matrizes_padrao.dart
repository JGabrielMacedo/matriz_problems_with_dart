import 'dart:io';

import 'package:matrizes/matrizes.dart';
import 'package:matrizes/src/controllers/matrizes_padrao_controller.dart';
import 'package:matrizes/src/models/matriz.dart';

class MatrizesPadraoView {
  final MatrizesEspeciaisController controller = MatrizesEspeciaisController();
  void build() {
    while (true) {
      buildMenuView();
      final String? option = stdin.readLineSync();
      final int? intOption = int.tryParse(option ?? "");
      switch (intOption) {
        case 1:
          buildMatrizDiagonalView();
          continue;
        case 2:
          buildMatrizIdentidadeView();
          continue;
        case 3:
          buildMatrizSimetricaView();
          continue;
        case 4:
          buildMatrizTranspostaView();
          continue;
        default:
          return;
      }
    }
  }

  void buildMenuView() {
    VisualHelper.faixa();
    print("Qual matriz especial você deseja ver?");
    print("1 -> Matriz diagonal");
    print("2 -> Matriz identidade");
    print("3 -> Matriz simétrica");
    print("4 -> Determinar a transposta de uma matriz existente");
    print("0 -> Voltar");
    VisualHelper.faixa();
  }

  void buildMatrizDiagonalView() {
    while (true) {
      VisualHelper.faixa();
      print("MATRIZ DIAGONAL");
      print(
          "Digite o número que representará a ordem da matriz diagonal ou 0 para voltar");
      final String? ordem = stdin.readLineSync();
      final int? ordemInt = int.tryParse(ordem ?? "");
      if (ordemInt == null) {
        print("NUMERO INVALIDO");
        continue;
      }

      if (ordemInt == 0) return;

      Matriz<int> matriz = controller.buildMatrizDiagonal(ordemInt);
      VisualHelper.printaMatriz(matriz);
    }
  }

  void buildMatrizIdentidadeView() {
    while (true) {
      VisualHelper.faixa();
      print("MATRIZ Identidade");
      print(
          "Digite o número que representará a ordem da matriz identidade ou 0 para voltar");
      final String? ordem = stdin.readLineSync();
      final int? ordemInt = int.tryParse(ordem ?? "");
      if (ordemInt == null) {
        print("NUMERO INVALIDO");
        continue;
      }

      if (ordemInt == 0) return;

      Matriz<int> matriz = controller.buildMatrizIdentidade(ordemInt);
      VisualHelper.printaMatriz(matriz);
    }
  }

  void buildMatrizSimetricaView() {
    while (true) {
      VisualHelper.faixa();
      print("MATRIZ SIMÉTRICA");
      print(
          "Digite o número que representará a ordem da matriz simétrica ou 0 para voltar");
      final String? ordem = stdin.readLineSync();
      final int? ordemInt = int.tryParse(ordem ?? "");
      if (ordemInt == null) {
        print("NUMERO INVALIDO");
        continue;
      }

      if (ordemInt == 0) return;

      Matriz<int> matriz = controller.buildMatrizSimetrica(ordemInt);
      VisualHelper.printaMatriz(matriz);
    }
  }

  void buildMatrizTranspostaView() {
    while (true) {
      VisualHelper.faixa();
      print("MATRIZ SIMÉTRICA");
      print(
          "Você digitará as linhas e as colunas da matriz a ser transformada \nCaso queria voltar, digite 0 a qualquer momento");
      print("");
      late int? linhasInt;
      while (true) {
        print("Digite o número de linhas");

        final String? linhas = stdin.readLineSync();
        linhasInt = int.tryParse(linhas ?? "");

        if (linhasInt != null) break;

        if (linhasInt == 0) return;
      }

      print("");
      late int? colunasInt;
      while (true) {
        print("Digite o número de colunas");

        final String? colunas = stdin.readLineSync();
        colunasInt = int.tryParse(colunas ?? "");

        if (colunasInt != null) break;

        if (colunasInt == 0) return;
      }

      print("Digite qualquer letra para cancelar aqui");
      Matriz<int> matriz = List.generate(
        linhasInt,
        (index) => List.filled(colunasInt!, 0),
      );

      for (var i = 0; i < linhasInt; i++) {
        for (var j = 0; j < colunasInt; j++) {
          print("Digite o valor para a posição [$i][$j]");
          final String? value = stdin.readLineSync();
          final valueInt = int.tryParse(value ?? "");
          if (valueInt == null) return;

          matriz[i][j] = valueInt;
          VisualHelper.printaMatriz(matriz);
        }
      }

      print("Sua matriz simétrica é");

      Matriz<int> transposta = controller.buildTranspostaDe(matriz);
      VisualHelper.printaMatriz(transposta);
    }
  }
}
