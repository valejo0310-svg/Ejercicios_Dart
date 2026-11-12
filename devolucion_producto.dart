
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

  // 2. Venta original de la mesa 7
  Map<String, int> venta = {
    'Sancocho': 2,
    'Gaseosa': 3,
    'Postre del día': 2,
  };

  // 3. Datos de la devolución
  String productoDevuelto = 'Gaseosa';
  int cantidadDevuelta = 1;
  String motivo = 'Producto en mal estado';
  bool autorizadoPorAdmin = false;

  const int limiteSinAutorizacion = 30000;
  List<String> devoluciones = [];

  // 4. Calcular total original
  int totalOriginal = 0;

  for (var producto in venta.entries) {
    int precio = menu[producto.key] ?? 0;
    totalOriginal += precio * producto.value;
  }

  print('Total original: $totalOriginal');

  // 5. Validar y procesar la devolución
  if (!venta.containsKey(productoDevuelto)) {
    print('Error: el producto no está en la venta');

  } else if (cantidadDevuelta <= 0) {
    print('Error: la cantidad debe ser mayor que cero');

  } else if (cantidadDevuelta > venta[productoDevuelto]!) {
    print('Error: la cantidad supera lo vendido');

  } else {
    int precio = menu[productoDevuelto]!;
    int valorDevolucion = precio * cantidadDevuelta;

    // 6. Verificar autorización
    if (valorDevolucion > limiteSinAutorizacion &&
        !autorizadoPorAdmin) {
      print('Error: requiere autorización del administrador');

    } else {
      // 7. Actualizar la cantidad del producto
      int cantidadRestante =
          venta[productoDevuelto]! - cantidadDevuelta;

      if (cantidadRestante == 0) {
        venta.remove(productoDevuelto);
      } else {
        venta[productoDevuelto] = cantidadRestante;
      }

      // 8. Registrar la devolución
      devoluciones.add(
        '$cantidadDevuelta x $productoDevuelto '
        '($motivo): $valorDevolucion'
      );

      print('Devolución registrada: $valorDevolucion');
    }
  }

  // 9. Recalcular el total de la venta
  int nuevoTotal = 0;

  for (var producto in venta.entries) {
    int precio = menu[producto.key] ?? 0;
    nuevoTotal += precio * producto.value;
  }

  // 10. Mostrar resultados
  print('Venta actualizada: $venta');
  print('Nuevo total: $nuevoTotal');
  print('Devoluciones: $devoluciones');

  /**
   * Lo que debe hacer:
1. Calcular y mostrar el total original de la venta.
2. Validar que el producto haga parte de la venta y que la cantidad a devolver sea mayor que 0 y no supere
la cantidad vendida.
3. Calcular el valor de la devolución. Si supera el límite y no hay autorización, mostrar un aviso y no hacer
cambios.
4. Si todo está bien: restar la cantidad en el Map; si la cantidad queda en 0, eliminar el producto de la venta.
5. Agregar a la lista devoluciones un texto con la cantidad, el producto, el motivo y el valor.
6. Recalcular y mostrar la venta actualizada y el nuevo total.
   */
}
