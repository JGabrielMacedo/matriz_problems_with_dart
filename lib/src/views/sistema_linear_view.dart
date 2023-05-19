import 'dart:io';

import 'package:matrizes/matrizes.dart';
import 'package:matrizes/src/controllers/sistema_linear.dart';
import 'package:matrizes/src/models/system_solution_data.dart';

class LinearSystemView {
  final LinearSystemController controller;

  const LinearSystemView({
    this.controller = const LinearSystemController(),
  });

  void build() {
    while (true) {
      buildMenuView();
      final String? option = stdin.readLineSync();
      final int? intOption = int.tryParse(option ?? "");
      switch (intOption) {
        case 1:
          solveSystemWithTwoVariables();
          continue;
        case 2:
          solveSystemWithThreeVariables();
          continue;
        default:
          return;
      }
    }
  }

  void buildMenuView() {
    VisualHelper.faixa();
    print("Qual tipo de operação você deseja executar?");
    print("1 -> Resolve sistema com duas variáveis (x, y)");
    print("2 -> Resolve sistema com três variáveis (x, y, z)");
    print("0 -> Voltar");
    VisualHelper.faixa();
  }
  
  void _showSystemViewWithTwoVariables({    
     double? a1,
     double? b1,
     double? c1,
     double? a2,
     double? b2,
     double? c2,
}) {
    print("(${a1 != null? a1.toString() : "a1"})x + (${b1 != null? b1.toString() : "b1"})y = (${c1 != null? c1.toString() : "c1"})");
    print("(${a2 != null? a2.toString() : "a2"})x + (${b2 != null? b2.toString() : "b2"})y = (${c2 != null? c2.toString() : "c2"})");
  }

  void _showSystemViewWithThreeVariables({    
     double? a1,
     double? b1,
     double? c1,
     double? d1,
     double? a2,
     double? b2,
     double? c2,
     double? d2,
     double? a3,
     double? b3,
     double? c3,
     double? d3,
}) {
    print("(${a1 != null? a1.toString() : "a1"})x + (${b1 != null? b1.toString() : "b1"})y + (${c1 != null? c1.toString() : "c1"})z = (${d1 != null? d1.toString() : "d1"})");
    print("(${a2 != null? a2.toString() : "a2"})x + (${b2 != null? b2.toString() : "b2"})y + (${c2 != null? c2.toString() : "c2"})z = (${d2 != null? d2.toString() : "d2"})");
    print("(${a3 != null? a3.toString() : "a3"})x + (${b3 != null? b3.toString() : "b3"})y + (${c3 != null? c3.toString() : "c3"})z = (${d3 != null? d3.toString() : "d3"})");
  }

  double? _receiveANumber(String varName) {
      print("Insira um número para $varName para continuar ou um caractere qualquer para interromper");

      final double? number = double.tryParse(stdin.readLineSync().toString());

      return number;
  }
  
  void solveSystemWithThreeVariables() {
    print("Você precisará inserir os valores a seguir para formar o sistema: ");

    _showSystemViewWithThreeVariables();

    final double? a1 = _receiveANumber("a1");
    if (a1 == null) return;

    _showSystemViewWithThreeVariables(a1: a1);

    final double? b1 = _receiveANumber("b1");
    if (b1 == null) return;

    _showSystemViewWithThreeVariables(a1: a1, b1: b1);

    final double? c1 = _receiveANumber("c1");
    if (c1 == null) return;

    _showSystemViewWithThreeVariables(a1: a1, b1: b1, c1: c1);

    final double? d1 = _receiveANumber("d1");
    if (d1 == null) return;

    _showSystemViewWithThreeVariables(a1: a1, b1: b1, c1: c1, d1: d1);

    final double? a2 = _receiveANumber("a2");
    if (a2 == null) return;

    _showSystemViewWithThreeVariables(a1: a1, b1: b1, c1: c1, d1: d1, a2: a2);

    final double? b2 = _receiveANumber("b2");
    if (b2 == null) return;

    _showSystemViewWithThreeVariables(a1: a1, b1: b1, c1: c1, d1: d1, a2: a2, b2: b2);

    final double? c2 = _receiveANumber("c2");
    if (c2 == null) return;

    _showSystemViewWithThreeVariables(a1: a1, b1: b1, c1: c1, d1: d1, a2: a2, b2: b2, c2: c2);

    final double? d2 = _receiveANumber("d2");
    if (d2 == null) return;

    _showSystemViewWithThreeVariables(a1: a1, b1: b1, c1: c1, d1: d1, a2: a2, b2: b2, c2: c2, d2: d2);

    final double? a3 = _receiveANumber("a3");
    if (a3 == null) return;

    _showSystemViewWithThreeVariables(a1: a1, b1: b1, c1: c1, d1: d1, a2: a2, b2: b2, c2: c2, d2: d2, a3: a3);

    final double? b3 = _receiveANumber("b3");
    if (b3 == null) return;

    _showSystemViewWithThreeVariables(a1: a1, b1: b1, c1: c1, d1: d1, a2: a2, b2: b2, c2: c2, d2: d2, a3: a3, b3: b3);

    final double? c3 = _receiveANumber("c3");
    if (c3 == null) return;

    _showSystemViewWithThreeVariables(a1: a1, b1: b1, c1: c1, d1: d1, a2: a2, b2: b2, c2: c2, d2: d2, a3: a3, b3: b3, c3: c3);

    final double? d3 = _receiveANumber("d3");
    if (d3 == null) return;

    _showSystemViewWithThreeVariables(a1: a1, b1: b1, c1: c1, d1: d1, a2: a2, b2: b2, c2: c2, d2: d2, a3: a3, b3: b3, c3: c3, d3: d3);

    final SystemSolutionData? result = controller.solveLinearSystemThreeVariables(a1: a1, b1: b1, c1: c1, d1: d1, a2: a2, b2: b2, c2: c2, d2: d2, a3: a3, b3: b3, c3: c3, d3: d3);
    if (result == null) print("Determinante igual a 0, sem solucao ou infinitas soluções");

    print("A solução do sistema é x = ${result?.x}, y = ${result?.y} e z = ${result?.z}");
  }
  
  void solveSystemWithTwoVariables() {
        print("Você precisará inserir os valores a seguir para formar o sistema: ");

    _showSystemViewWithTwoVariables();

    final double? a1 = _receiveANumber("a1");
    if (a1 == null) return;

    _showSystemViewWithTwoVariables(a1: a1);

    final double? b1 = _receiveANumber("b1");
    if (b1 == null) return;

    _showSystemViewWithTwoVariables(a1: a1, b1: b1);

    final double? c1 = _receiveANumber("c1");
    if (c1 == null) return;

    _showSystemViewWithTwoVariables(a1: a1, b1: b1, c1: c1);

    final double? a2 = _receiveANumber("a2");
    if (a2 == null) return;

    _showSystemViewWithTwoVariables(a1: a1, b1: b1, c1: c1, a2: a2);

    final double? b2 = _receiveANumber("b2");
    if (b2 == null) return;

    _showSystemViewWithTwoVariables(a1: a1, b1: b1, c1: c1, a2: a2, b2: b2);

    final double? c2 = _receiveANumber("c2");
    if (c2 == null) return;

    _showSystemViewWithTwoVariables(a1: a1, b1: b1, c1: c1, a2: a2, b2: b2, c2: c2);

    final SystemSolutionData? result = controller.solveLinearSystemTwoVariables(a1: a1, b1: b1, c1: c1, a2: a2, b2: b2, c2: c2);
    if (result == null) print("Determinante igual a 0, sem solucao ou infinitas soluções");

    print("A solução do sistema é x = ${result?.x} e y = ${result?.y}");
  }
}