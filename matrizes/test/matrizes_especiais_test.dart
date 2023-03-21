import 'package:matrizes/src/controllers/matrizes_padrao_controller.dart';
import 'package:matrizes/src/models/matriz.dart';
import 'package:test/test.dart';

void main() {
  var sut = MatrizesEspeciaisController();

  setUp(() {
    sut = MatrizesEspeciaisController();
  });

  test('Deve construir uma matriz diagonal de ordem 3 valida', () {
    Matriz<int> diagonalOrdem3 = [
      [3, 0, 0],
      [0, 3, 0],
      [0, 0, 3],
    ];
    Matriz<int> diagonal = sut.buildMatrizDiagonal(3);
    expect(diagonal, diagonalOrdem3);
  });

  test('Deve construir uma matriz diagonal de ordem 2 valida', () {
    Matriz<int> diagonalOrdem2 = [
      [2, 0],
      [0, 2],
    ];
    Matriz<int> diagonal = sut.buildMatrizDiagonal(2);
    expect(diagonal, diagonalOrdem2);
  });

  test('Deve construir uma matriz identidade de ordem 3', () {
    Matriz<int> indentidadeOrdem3 = [
      [1, 0, 0],
      [0, 1, 0],
      [0, 0, 1],
    ];
    Matriz<int> diagonal = sut.buildMatrizIdentidade(3);
    expect(diagonal, indentidadeOrdem3);
  });

  test('Deve construir uma matriz identidade de ordem 2', () {
    Matriz<int> indentidadeOrdem2 = [
      [1, 0],
      [0, 1],
    ];
    Matriz<int> diagonal = sut.buildMatrizIdentidade(2);
    expect(diagonal, indentidadeOrdem2);
  });

  test('Deve construir uma matriz simétrica de ordem 3', () {
    Matriz<int> matrizSimetrica = sut.buildMatrizSimetrica(3);
    for (var i = 0; i < 3; i++) {
      for (var j = 0; j < 3; j++) {
        expect(matrizSimetrica[i][j], matrizSimetrica[j][i]);
      }
    }
  });
  
  test('Deve construir uma matriz simétrica de ordem 2', () {
    Matriz<int> matrizSimetrica = sut.buildMatrizSimetrica(2);
    for (var i = 0; i < 2; i++) {
      for (var j = 0; j < 2; j++) {
        expect(matrizSimetrica[i][j], matrizSimetrica[j][i]);
      }
    }
  });


  test('Deve determinar a transposta de uma matriz 2x3', () {
    Matriz<int> matrizSimples =[
      [1, 2, 3],
      [6, 5, 4],
    ];
    Matriz<int> transposta = sut.buildTranspostaDe(matrizSimples);

    expect(transposta, [[1, 6], [2, 5], [3, 4],]);
  });

  test('Deve determinar a transposta de uma matriz 3x2', () {
    Matriz<int> matrizSimples =[
      [1, 2],
      [3, 4],
      [5, 6]
    ];
    Matriz<int> transposta = sut.buildTranspostaDe(matrizSimples);

    expect(transposta, [[1, 3, 5], [2, 4, 6]]);
  });

    test('Deve determinar a transposta de uma matriz 2x2', () {
    Matriz<int> matrizSimples =[
      [1, 2],
      [3, 4]
    ];
    Matriz<int> transposta = sut.buildTranspostaDe(matrizSimples);

    expect(transposta, [[1, 3], [2, 4]]);
  });
}
