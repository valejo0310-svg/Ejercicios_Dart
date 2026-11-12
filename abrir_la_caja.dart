void main() {
  String usuario = 'Laura';
 String rol = 'cajero'; // puede ser 'admin', 'cajero' o 'mesero'
 bool cajaAbierta = false;
 int baseInicial = 200000;
 const int baseMaxima = 10000000;
 List<String> movimientos = [];

 if (cajaAbierta) {
  print ('error: la caja debe estar cerrada antes de iniciar');
 }
 else if (rol != 'cajero' && rol != 'admin'){
    print ('error: no tienes autorización para abrir esta caja');
 } 
 else if (baseInicial < 0 ){
    print ('error: la base inicial no debe ser negativa');
 }
 else if (baseInicial > baseMaxima ){
  print ('la base inicial no debe ser mayor que la base maxima');
 }
 else {
  cajaAbierta = true;

  movimientos.add ('apertura por $usuario con base $baseInicial');
  print ('caja abierta por $usuario con base $baseInicial');

 }

 String estado = cajaAbierta ? 'ABIERTA' : 'CERRADA';

 print('Estado de la caja: $estado');
 print('Movimientos: $movimientos');




  /*Reglas que debe programar:
1. Si la caja ya está abierta, mostrar: “Error: ya hay una caja abierta”.
2. Solo los roles cajero y admin pueden abrir la caja.
3. La base no puede ser negativa ni mayor que baseMaxima.
4. Si todo está bien: cambiar cajaAbierta a true, agregar a movimientos el texto “APERTURA por Laura con
base 200000” y mostrar un mensaje de confirmación.
5. Al final, mostrar el estado de la caja (ABIERTA o CERRADA) usando el operador ternario, y la lista de
movimientos. */
}
