void main() {
  print(greetEveryone());

  print('Suma: ${addTwoNumbers(10, 5)}');
  print('Suma: ${addTwoNumbersArrow(10, 25)}');
  print('Suma: ${addTwoNumbersOptional(10, 2)}');

  print(greetPerson(name: 'Rodrigo', message: 'Hi'));
}

String greetEveryone() {
  return 'Hello everyone!';
}

String arrow() => 'Hello everyone!';

int addTwoNumbers(int a, int b) {
  return a + b;
}

int addTwoNumbersArrow(int a, int b) => a + b;

int addTwoNumbersOptional(int a, [int b = 0]) {
  return a + b;
}

String greetPerson({required String name, String message = 'Hola'}) {
  return '$message, $name';
}
