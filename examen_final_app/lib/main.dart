import 'package:examen_final_app/bloc/entidades/producto.dart';
import 'package:examen_final_app/bloc/productos_data.dart';
import 'package:examen_final_app/crear_producto.dart';
import 'package:examen_final_app/detalle_producto.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: const Color(0xFFF5F5F5),
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 50, 0, 30),
                      child: Text(
                        'Lista de productos',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 30,
                        ),
                      ),
                    )
                  ],
                ),
                Expanded(child: _lista(context))
              ],
            ),
          ),
        ));
  }

  Widget _lista(context) {
    return FutureBuilder(
        future: ProductosData().productos(),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasData) {
            final productos = snapshot.data;
            return ListView.builder(
                itemCount: productos!.length,
                itemBuilder: (context, i) => item(context, productos[i]));
          } else {
            return Center(child: Text("No hay datos"));
          }
        });
  }

  Widget item(BuildContext context, Producto producto) {
    if (producto.codigoProducto == 0) {
      return Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
              child: GestureDetector(
                  onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CrearProducto()))
                      },
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: const Color(0xFFF9F9F9),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10, 10, 0, 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 5),
                              child: Text(
                                producto.nombre,
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  color: Color(0xFF3568F7),
                                  fontSize: 15,
                                ),
                              ))
                        ],
                      ),
                    ),
                  )))
        ],
      );
    } else {
      return Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
              child: GestureDetector(
                  onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetalleProducto(producto.codigoProducto)))
                      },
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: const Color(0xFF3568F7),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20, 15, 0, 15),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 5),
                              child: Text(
                                producto.nombre,
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  color: Color(0xFFF9F9F9),
                                  fontSize: 20,
                                ),
                              )),
                          Text(
                            producto.dimensiones,
                            style: const TextStyle(
                              color: Color(0xFFF9F9F9),
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                  )))
        ],
      );
    }
  }
}
