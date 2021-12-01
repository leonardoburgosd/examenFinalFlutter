class DetalleVenta {
  int acumulado;
  DetalleVenta({required this.acumulado});

  factory DetalleVenta.fromJson(Map<dynamic, dynamic> json) =>
      DetalleVenta(acumulado: json["acumulado"]);
  Map<dynamic, dynamic> toJson() => {"acumulado": acumulado};
}
