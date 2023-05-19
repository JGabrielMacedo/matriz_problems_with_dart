import 'package:matrizes/src/models/matriz.dart';
import 'package:matrizes/src/models/system_solution_data.dart';

class LinearSystemController {
  
  const LinearSystemController();

  SystemSolutionData? solveLinearSystemTwoVariables({
    required double a1,
    required double b1,
    required double c1,
    required double a2,
    required double b2,
    required double c2,
  }) {
    final double determinant = a1 * b2 - a2 * b1;

    final bool systemDoesNotHaveSolution = determinant == 0;

    if (systemDoesNotHaveSolution) return null;

    final double x = (b2 * c1 - b1 * c2) / determinant;
    final double y = (a1 * c2 - a2 * c1) / determinant;

    return SystemSolutionData(x: x, y: y);
  }

  SystemSolutionData? solveLinearSystemThreeVariables({
    required double a1,
    required double b1,
    required double c1,
    required double d1,
    required double a2,
    required double b2,
    required double c2,
    required double d2,
    required double a3,
    required double b3,
    required double c3,
    required double d3,
  }) {
    final double determinant = a1 * (b2 * c3 - b3 * c2) -
        b1 * (a2 * c3 - a3 * c2) +
        c1 * (a2 * b3 - a3 * b2);

    final bool systemDoesNotHaveSolution = determinant == 0;

    if (systemDoesNotHaveSolution) return null;

    final double x = (d1 * (b2 * c3 - b3 * c2) -
            b1 * (d2 * c3 - d3 * c2) +
            c1 * (d2 * b3 - d3 * b2)) /
        determinant;

    final double y = (a1 * (d2 * c3 - d3 * c2) -
            d1 * (a2 * c3 - a3 * c2) +
            c1 * (a2 * d3 - a3 * d2)) /
        determinant;

    final double z = (a1 * (b2 * d3 - b3 * d2) -
            b1 * (a2 * d3 - a3 * d2) +
            d1 * (a2 * b3 - a3 * b2)) /
        determinant;

    return SystemSolutionData(x: x, y: y, z: z);
  }
}