import 'dart:io';

import 'package:matrizes/matrizes.dart';
import 'package:matrizes/src/controllers/formulas_especiais_controller.dart';
import 'package:matrizes/src/models/matriz.dart';

class FormulasEspecificas {
  final FormulasEspecificasConstroller constroller =
      FormulasEspecificasConstroller();

  void build() {
    while (true) {
      buildMenuView();
      final String? option = stdin.readLineSync();
      final int? intOption = int.tryParse(option ?? "");
      switch (intOption) {
        case 1:
          buildPrimeiraContaView();
          continue;
        case 2:
          buildSegundaContaView();
          continue;
        case 3:
          buildTerceiraContaView();
          continue;
        case 4:
          buildQuartaContaView();
          continue;
        default:
          return;
      }
    }
  }

  void buildMenuView() {
    VisualHelper.faixa();
    print("Qual fórmula você deseja executar");
    const String primeiraOp = """

1 -> A3x2, aij = { 3i + 2j, se i = j
                 { 4i - 3j, se i != j
    """;
    const String segundaOp = """

2 -> A4x4, aij = { i ^ 2 + 3j, se i > j
                 { 5i - j ^ 2, se i < j
                 { i . j, se j = i
    """;
    const String terceiraOp = """

3 -> A6x1, aij = { 3, se i = j
                 { 2 - i, se i != j
    """;

    const String quartaOp = """

4 -> A3x3, aij = { i ^ 2, se i > j
                 { j ^ 2, se i < j
                 { 2i - 4j, se i = j
    """;

    print(primeiraOp + segundaOp + terceiraOp + quartaOp);
    VisualHelper.faixa();
  }

  void buildPrimeiraContaView() {
    final Matriz<int> result = constroller.calculaPri();
    VisualHelper.faixa();
    print("Resultado: \n");
    VisualHelper.printaMatriz(result);
    VisualHelper.faixa();
  }

  void buildSegundaContaView() {
    final Matriz<int> result = constroller.calculaSeg();
    VisualHelper.faixa();
    print("Resultado: \n");
    VisualHelper.printaMatriz(result);
    VisualHelper.faixa();
  }

  void buildTerceiraContaView() {
    final Matriz<int> result = constroller.calculaTer();
    VisualHelper.faixa();
    print("Resultado: \n");
    VisualHelper.printaMatriz(result);
    VisualHelper.faixa();
  }

  void buildQuartaContaView() {
    final Matriz<int> result = constroller.calculaQuar();
    VisualHelper.faixa();
    print("Resultado: \n");
    VisualHelper.printaMatriz(result);
    VisualHelper.faixa();
  }
}
