import 'package:examen_final_app/bloc/entidades/producto.dart';
import 'package:examen_final_app/bloc/productos_data.dart';
import 'package:examen_final_app/main.dart';
import 'package:flutter/material.dart';

class CrearProducto extends StatelessWidget {
  Producto productoNuevo = Producto();
  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            color: Color(0xFFEEEEEE),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(40, 60, 0, 40),
                    child: Text('Nuevo producto',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 30,
                        )),
                  )
                ],
              ),
              Expanded(child: formulario(context))
            ],
          ),
        ),
      ),
    );
  }

  Widget formulario(context) {
    return Column(mainAxisSize: MainAxisSize.max, children: [
      nombreInput(context),
      gamaInput(context),
      dimensionesInput(context),
      precioVentaInput(context),
      stockInput(context),
      btn_agregarProducto(context)
    ]);
  }

  final nombre = TextEditingController();
  Widget nombreInput(context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: TextField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Nombre del producto',
            ),
            controller: nombre));
  }

  final gama = TextEditingController();
  Widget gamaInput(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: TextField(
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            labelText: 'Gama',
          ),
          controller: gama),
    );
  }

  final dimensiones = TextEditingController();
  Widget dimensionesInput(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: TextField(
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            labelText: 'Dimensiones',
          ),
          controller: dimensiones),
    );
  }

  final precio = TextEditingController();
  Widget precioVentaInput(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: TextField(
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            labelText: 'Precio de venta',
          ),
          controller: precio),
    );
  }

  final stock = TextEditingController();
  Widget stockInput(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: TextField(
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            labelText: 'Stock',
          ),
          controller: stock),
    );
  }

  Widget btn_agregarProducto(context) {
    return GestureDetector(
        onTap: () => {
              productoNuevo.nombre = nombre.text,
              productoNuevo.gama = int.parse(gama.text),
              productoNuevo.dimensiones = dimensiones.text,
              productoNuevo.precioVenta = double.parse(precio.text),
              productoNuevo.cantidadEnStock = int.parse(stock.text),
              ProductosData()
                  .crearProducto(productoNuevo)
                  .then((value) => print(value)),
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => MyApp()))
            },
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: const Color(0xFF3568F7),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      child: Text(
                        'Crear producto',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Color(0xFFF9F9F9),
                          fontSize: 15,
                        ),
                      ))
                ],
              ),
            ),
          ),
        ));
  }
}
