void main() {
  final numbers = [1, 2, 3, 4, 5, 5, 5, 6, 7, 8, 9, 9, 10];

  print('List original $numbers');
  print('Lengt ${numbers.length}');
  print('Index 0: ${numbers[0]}');
  print('First: ${numbers.first}');
  print('Reverse List: ${numbers.reversed.toList()}');
  print('Reverse Set: ${numbers.reversed.toSet()}');

  final numbersGreaterThan5 = numbers.where((element) => element > 5);
  print(numbersGreaterThan5.toSet().toList());
}
