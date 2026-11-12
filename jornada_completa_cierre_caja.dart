void main() {
  // 1. Datos iniciales de la jornada
  int baseInicial = 200000;

  List<int> totales = [
    45000, 120000, 38000, 76000, 54000, 91000
  ];

  List<String> medios = [
    'efectivo', 'debito', 'efectivo',
    'credito', 'efectivo', 'debito'
  ];

  Map<String, int> egresos = {
    'Compra de hielo': 15000,
    'Recarga de gas': 20000
  };

  int efectivoContado = 300000;

  // 2. Acumular ventas por medio de pago
  Map<String, int> porMedio = {
    'efectivo': 0,
    'debito': 0,
    'credito': 0
  };

  int totalVendido = 0;
  int ventaMayor = 0;

  for (int i = 0; i < totales.length; i++) {
    int valor = totales[i];
    String medio = medios[i];

    // Acumular el valor de la venta
    totalVendido += valor;

    // Registrar el medio de pago
    porMedio[medio] = porMedio[medio]! + valor;

    // Identificar la venta mayor
    if (valor > ventaMayor) {
      ventaMayor = valor;
    }
  }

  // 3. Calcular cantidad y promedio
  int cantidadVentas = totales.length;

  double promedio = cantidadVentas > 0
      ? totalVendido / cantidadVentas
      : 0;

  // 4. Calcular los gastos
  int totalEgresos = 0;

  for (int gasto in egresos.values) {
    totalEgresos += gasto;
  }

  // 5. Calcular el efectivo esperado
  int efectivoEsperado = baseInicial +
      porMedio['efectivo']! - totalEgresos;

  // 6. Comparar con el efectivo contado
  int diferencia = efectivoContado - efectivoEsperado;

  // 7. Generar informe de cierre
  print('=== CIERRE DE CAJA ===');

  print('Ventas en efectivo: ${porMedio['efectivo']}');
  print('Ventas en débito: ${porMedio['debito']}');
  print('Ventas a crédito: ${porMedio['credito']}');

  print('Total vendido: $totalVendido');
  print('Cantidad de ventas: $cantidadVentas');
  print('Venta mayor: $ventaMayor');

  print('Promedio por venta: ${promedio.toStringAsFixed(0)}');

  print('Egresos: $totalEgresos');

  print('Efectivo esperado: $efectivoEsperado');
  print('Efectivo contado: $efectivoContado');

  // 8. Mostrar el resultado del arqueo
  if (diferencia == 0) {
    print('Caja cuadrada');

  } else if (diferencia > 0) {
    print('Sobrante de $diferencia');

  } else {
    print('Faltante de ${diferencia.abs()}');
  }
  /**
   * Lo que debe hacer:
1. Crear un Map porMedio con efectivo, debito y credito en 0, y recorrer las ventas con un for con índice
para acumular el total de cada medio.
2. Calcular el total vendido, la cantidad de ventas, la venta mayor y el promedio por venta (pista:
promedio.toStringAsFixed(0) lo muestra sin decimales).
3. Sumar los egresos recorriendo los valores del Map.
4. Calcular el efectivo esperado: base + ventas en efectivo - egresos.
5. Comparar con el efectivo contado y mostrar si la caja está cuadrada, si hay sobrante o si hay faltante, y
de cuánto.
6. Mostrar el informe de cierre completo.
   */
}
