import 'package:examen_final_app/bloc/entidades/detalle_venta.dart';
import 'package:examen_final_app/bloc/entidades/producto.dart';
import 'package:examen_final_app/detalle_producto.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ProductosData {
  Uri url = Uri.https(
      'lockappard.azurewebsites.net', '/api/productos', {"q": "http"});

  Future<List<dynamic>> productos() async {
    var response = await http.get(url, headers: {'Accept': 'application/json'});
    if (convert.jsonDecode(response.body) == null) {
      return [];
    } else {
      final List<Producto> productos = [];
      final listaElementos = convert.jsonDecode(response.body);
      Producto nuevoProducto =
          new Producto(codigoProducto: 0, nombre: "+ Nuevo producto ", gama: 0);
      productos.add(nuevoProducto);
      for (Map i in listaElementos) {
        productos.add(Producto.fromJson(i));
      }
      return productos;
    }
  }

  Future<bool> crearProducto(Producto producto) async {
    Map data = {
      'nombre': producto.nombre,
      'gama': producto.gama,
      'dimensiones': producto.dimensiones,
      'cantidadEnStock': producto.cantidadEnStock,
      'precioVenta': producto.precioVenta
    };
    final resp = await http.post(url,
        body: convert.json.encode(data),
        headers: {'Content-Type': 'application/json'});
    if (resp.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<String> totalVentas(int productoId) async {
    Uri url = Uri.https('lockappard.azurewebsites.net',
        '/api/productos/' + productoId.toString(), {"q": "http"});
    var response = await http.get(url, headers: {'Accept': 'application/json'});
    final List<DetalleVenta> detalleProducto = [];
    if (convert.jsonDecode(response.body) == null) {
      return "";
    } else {
      final elemento = convert.jsonDecode(response.body);
      for (Map i in elemento) {
        detalleProducto.add(DetalleVenta.fromJson(i));
      }
      return detalleProducto[0].acumulado.toString();
    }
  }
}
