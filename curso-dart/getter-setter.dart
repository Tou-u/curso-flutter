void main() {
  final mySquare = Square(side: -2);
  // mySquare.side = 7;

  // mySquare._side = -5;

  print('Área: ${mySquare.area}');
}

class Square {
  double _side; // side * side

  Square({required double side})
      : assert(side >= 0, 'side must be >= 0'),
        _side = side;

  double get area {
    return _side * _side;
  }

  set side(double value) {
    print('settings new value $value');
    if (value < 0) throw 'Value must be >=0';

    _side = value;
  }

  // double calculateArea() => _side * _side;
}
