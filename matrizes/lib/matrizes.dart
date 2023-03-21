import 'dart:io';

import 'package:matrizes/src/controllers/matrizes_padrao_controller.dart';
import 'package:matrizes/src/models/matriz.dart';
import 'package:matrizes/src/views/formulas_especificas.dart';
import 'package:matrizes/src/views/matrizes_padrao.dart';

class Application {
  void main() {
    while (true) {
      print("");
      buildMenu();
      final String? option = stdin.readLineSync();
      final int? intOption = int.tryParse(option ?? "");
      switch (intOption) {
        case Route.matrizesEspeciais:
          MatrizesPadraoView().build();
          continue;
        case Route.formulasEspecificas:
          FormulasEspecificas().build();
          continue;
        case Route.finishProgram:
        default:
          print("Programa finalizado");

          exit(0);
      }
    }
  }

  void buildMenu() {
    VisualHelper.faixa();
    print("Menu");
    VisualHelper.faixa();
    print("Digite ${Route.finishProgram} para encerrar o programa");
    print("Digite ${Route.matrizesEspeciais} para ver as Matrizes Especiais");
    print(
        "Digite ${Route.formulasEspecificas} para verificar algumas matriculas geradas por fórmula");
        print("")
  }
}

class Route {
  static const int finishProgram = 0;
  static const int matrizesEspeciais = 1;
  static const int formulasEspecificas = 2;
  static const int operacaoEntreMatrizes = 3;
}

class VisualHelper {
  static void faixa({int quantidade = 10}) {
    String faixa = "";
    for (var i = 0; i < quantidade; i++) {
      faixa += "=";
    }
    print(faixa);
  }

  static void printaMatriz(Matriz<int> matriz) {
    for (var element in matriz) {
      print(element);
    }
  }
}
