void main() {
  final wolverine = new Hero(name: 'Logal', power: 'Regeneración');

  print(wolverine);
}

class Hero {
  String name;
  String power;

  Hero({required this.name, required this.power});

  @override
  String toString() {
    return '$name - $power';
  }
  // Hero(this.name, this.power);

  // Hero(String pName, String pPower)
  //     : name = pName,
  //       power = pPower;
}
