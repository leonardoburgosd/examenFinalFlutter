import 'package:examen_final_app/bloc/productos_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetalleProducto extends StatelessWidget {
  final int codigoProducto;
  const DetalleProducto(this.codigoProducto, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    'Total de ventas ',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 30,
                    ),
                  ),
                )
              ],
            ),
            Expanded(child: totalVenta(context))
          ],
        ),
      ),
    );
  }

  Widget totalVenta(context) {
    return FutureBuilder(
        future: ProductosData().totalVentas(codigoProducto),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            final cantidad = snapshot.data;
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  's/ ' + cantidad.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 50,
                  ),
                )
              ],
            );
          } else {
            return Center(child: Text("No hay datos"));
          }
        });
  }
}
