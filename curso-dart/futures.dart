void main() async {
  print('Inicio del programa');

  try {
    final value = await httpGet('google.com');
    print('Éxito: $value');
  } on Exception {
    print('Tenemos un Exception');
  } catch (e) {
    print('Tenemos un error: $e');
  } finally {
    print('Fin del trycatch');
  }

  print('Fin del programa');
}

Future<String> httpGet(String url) async {
  await Future.delayed(const Duration(seconds: 1));
  throw Exception('No hay parámetros en el URL');
  // return 'Tenemos un valor de la petición';

  // return Future.delayed(const Duration(seconds: 1), () {
  //   throw 'Error en la petición http';
  //   // return 'Respuesta de la petición http';
  // });
}
