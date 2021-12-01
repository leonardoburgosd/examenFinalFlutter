class Producto {
  int codigoProducto;
  String nombre;
  int gama;
  String dimensiones;
  String proveedor;
  int cantidadEnStock;
  double precioVenta;
  double precioProveedor;

  Producto(
      {this.codigoProducto = 0,
      this.nombre = "",
      this.gama = 0,
      this.dimensiones = "",
      this.proveedor = "",
      this.cantidadEnStock = 0,
      this.precioVenta = 0,
      this.precioProveedor = 0});

  factory Producto.fromJson(Map<dynamic, dynamic> json) => Producto(
      codigoProducto: json['codigoProducto'],
      nombre: json['nombre'],
      gama: json['gama'],
      dimensiones: json['dimensiones'],
      proveedor: json['proveedor'] ?? "",
      cantidadEnStock: json['cantidadEnStock'],
      precioVenta: json['precioVenta'] = 0.0,
      precioProveedor: json['precioProveedor'] = 0.0);

  Map<dynamic, dynamic> toJson() => {
        "codigoProducto": codigoProducto,
        "nombre": nombre,
        "gama": gama,
        "dimensiones": dimensiones,
        "proveedor": proveedor,
        "cantidadEnStock": cantidadEnStock,
        "precioVenta": precioVenta,
        "precioProveedor": precioProveedor
      };
}
