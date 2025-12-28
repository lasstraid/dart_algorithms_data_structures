import 'dart:math' as math;
import 'package:dart_algorithms/dart_algorithms.dart' as dart_algorithms;

void main(List<String> arguments) {
  final random = math.Random(123456);

  List<int> arr = List.generate(10, (int index) =>
    random.nextInt(100)
  );
  
  print('Desordenado: $arr');
  List<int> arr_02 = dart_algorithms.mergeSort(arr);
  print('Ordenado: $arr_02');
}
