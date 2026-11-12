
void main() {
  // 1. Menú de productos y precios
  Map<String, int> menu = {
    'Ajiaco': 28000,
    'Bandeja paisa': 32000,
    'Sancocho': 26000,
    'Limonada': 6000,
    'Jugo natural': 7000,
    'Gaseosa': 5000,
    'Postre del día': 9000,
  };

  // 2. Pedido de la mesa 4
  Map<String, int> pedido = {
    'Bandeja paisa': 2,
    'Limonada': 3,
    'Postre del día': 1,
    'Cazuela': 1,
  };

  bool incluirPropina = true;
  String medioPago = 'efectivo';
  int valorRecibido = 110000;
  String? referencia;

  // 3. Calcular el subtotal
  int subtotal = 0;

  for (var producto in pedido.entries) {
    String nombre = producto.key;
    int cantidad = producto.value;

    // Verificar si existe en el menú
    if (!menu.containsKey(nombre)) {
      print('$nombre: no existe en el menú, se omite');
      continue;
    }

    int precio = menu[nombre]!;
    int valor = precio * cantidad;

    subtotal += valor;

    print('$nombre x$cantidad = $valor');
  }

  // 4. Calcular propina y total
  int propina = incluirPropina
      ? subtotal * 10 ~/ 100
      : 0;

  int total = subtotal + propina;

  print('Subtotal: $subtotal');
  print('Propina: $propina');
  print('TOTAL: $total');

  // 5. Procesar el medio de pago
  switch (medioPago) {
    case 'efectivo':
      if (valorRecibido >= total) {
        int cambio = valorRecibido - total;
        print('Cambio: $cambio');
      } else {
        int faltante = total - valorRecibido;
        print('Dinero insuficiente. Faltan: $faltante');
      }

    case 'debito':
      if (referencia == null) {
        print('Error: falta referencia del pago');
      } else {
        print('Pago débito confirmado: $referencia');
      }

    default:
      print('Medio de pago no válido');
  }

   /**
  * Lo que debe hacer:
1. Recorrer el pedido. Si un producto no existe en el menú, mostrar un aviso y saltarlo con continue.
2. Mostrar cada línea: producto, cantidad y valor (precio × cantidad), y acumular el subtotal.
3. Calcular la propina (10 % del subtotal, sin decimales) solo si incluirPropina es true. Usen el operador
ternario.
4. Mostrar subtotal, propina y total.
5. Con un switch sobre medioPago: en efectivo, mostrar el cambio o cuánto falta si el dinero no alcanza; en
debito, mostrar un error si referencia es null o confirmar el pago; en otro caso, “Medio de pago no válido”.
  */

}

