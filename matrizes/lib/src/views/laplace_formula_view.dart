import 'dart:io';

import 'package:matrizes/matrizes.dart';
import 'package:matrizes/src/controllers/teorema_de_laplace_controller.dart';
import 'package:matrizes/src/models/matriz.dart';

class TeoremaDeLaplaceView {
  final TeoremaDeLaplaceController controller;

  const TeoremaDeLaplaceView({this.controller = const TeoremaDeLaplaceController()});

  void build() {
    while (true) {
      buildMenuView();
      final String? option = stdin.readLineSync();
      final int? intOption = int.tryParse(option ?? "");
      switch (intOption) {
        case 1:
          realizaContaTeoremaLaplace();
          continue;
        default:
          return;
      }
    }
  }

  void buildMenuView() {
    VisualHelper.faixa();
    print("Calculo de matriz através de Laplace");
    print("1 -> Iniciar calculo (Será executado o cálculo descrito na atividade)");
    print("Qualquer outra coisa para sair");
    VisualHelper.faixa();
  }

  int? recebeOrdemMatriz() {
    late int? linhasInt;
    while (true) {
      print("Digite a ordem da matriz");

      final String? linhas = stdin.readLineSync();
      linhasInt = int.tryParse(linhas ?? "");

      if (linhasInt == null || linhasInt < 4) {
        print("Digite uma ordem que seja acima de 3 ou 0 para sair");
        continue;
      }

      if (linhasInt == 0) return null;

      return linhasInt;
    }
  }

  Matriz<double>? recebeMatriz(int numLinhas, int numColunas) {
    print("Digite algo diferente de número para cancelar a captura de dados da matriz");
    print("");

    Matriz<double> matriz = List.generate(
      numLinhas,
      (index) => List.filled(numColunas, 0),
    );

    for (var i = 0; i < numLinhas; i++) {
      for (var j = 0; j < numColunas; j++) {
        print("Digite o valor para a posição [$i][$j]");
        final String? value = stdin.readLineSync();
        final valueDouble = double.tryParse(value ?? "");
        if (valueDouble == null) return null;

        matriz[i][j] = valueDouble;
        VisualHelper.printaMatriz(matriz);
      }
    }

    return matriz;
  }

  void realizaContaTeoremaLaplace() {
    final int? ordemDaMatriz = recebeOrdemMatriz();
    if (ordemDaMatriz == null || ordemDaMatriz == 0) return;

    print("A seguir você irá inserir os valores da matriz A");
    print("");
    final Matriz<double>? matriz = recebeMatriz(ordemDaMatriz, ordemDaMatriz);
    if (matriz == null) return;

    try {
      final double determinante =
          controller.calculateDeterminanteLaplace(matriz);

      print("O determinante da matriz A inserida é $determinante");
    } catch (e) {
      return;
    }
  }
}
