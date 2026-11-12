void main() {
  // 1. Menú del restaurante
  Map<String, int> menu = {
    'Ajiaco': 28000,
    'Bandeja paisa': 32000,
    'Sancocho': 26000,
    'Limonada': 6000,
    'Jugo natural': 7000,
    'Gaseosa': 5000,
    'Postre del día': 9000,
  };

  // 2. Pedido del cliente
  Map<String, int> pedido = {
    'Ajiaco': 3,
    'Jugo natural': 4,
    'Postre del día': 2,
    'Bandeja paisa': 1,
  };

  String? cupon = 'CUMPLE';
  bool clienteFrecuente = true;
  const int descuentoMaximo = 20;

  // 3. Calcular el subtotal del pedido
  int subtotal = 0;

  for (var producto in pedido.entries) {
    String nombre = producto.key;
    int cantidad = producto.value;

    int precio = menu[nombre] ?? 0;

    subtotal += precio * cantidad;
  }

  print('Subtotal: $subtotal');

  // 4. Acumular los descuentos
  int porcentajeDescuento = 0;
  List<String> motivos = [];

  // Descuento por compra grande
  if (subtotal >= 150000) {
    porcentajeDescuento += 10;
    motivos.add('compra mayor a 150.000 (10 %)');
  }

  // Descuento por cupón
  if (cupon != null) {
    switch (cupon.toUpperCase()) {
      case 'CUMPLE':
        porcentajeDescuento += 15;
        motivos.add('cupón CUMPLE (15 %)');

      case 'ESTUDIANTE':
        porcentajeDescuento += 5;
        motivos.add('cupón ESTUDIANTE (5 %)');

      default:
        print('Aviso: cupón no válido');
    }
  }

  // Descuento por cliente frecuente
  if (clienteFrecuente) {
    porcentajeDescuento += 5;
    motivos.add('cliente frecuente (5 %)');
  }

  // 5. Aplicar el descuento máximo
  if (porcentajeDescuento > descuentoMaximo) {
    print(
      'El descuento de $porcentajeDescuento % '
      'supera el máximo; se aplica $descuentoMaximo %'
    );

    porcentajeDescuento = descuentoMaximo;
  }

  // 6. Calcular descuento y total
  int descuento = subtotal * porcentajeDescuento ~/ 100;
  int total = subtotal - descuento;

  print('Descuento: $descuento');
  print('TOTAL A PAGAR: $total');
  print('Motivos: ${motivos.join(', ')}');

  /**
   * Lo que debe hacer:
1. Calcular el subtotal del pedido.
2. Acumular el porcentaje de descuento y guardar en una lista motivos el texto de cada descuento aplicado.
3. Revisar el cupón solo si no es null. Acepten el cupón en mayúsculas o minúsculas (pista:
cupon.toUpperCase()).
4. Si el porcentaje supera el tope, avisar y dejarlo en 20 %.
5. Calcular el valor del descuento sin decimales y el total a pagar. Mostrar el detalle y los motivos
   */
}
