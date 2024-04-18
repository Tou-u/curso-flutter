void main() {
  emitNumbers().listen((event) {
    print('String value: $event');
  });
}

Stream<int> emitNumbers() {
  return Stream.periodic(const Duration(seconds: 1), (value) {
    return value;
  }).take(5);
}
