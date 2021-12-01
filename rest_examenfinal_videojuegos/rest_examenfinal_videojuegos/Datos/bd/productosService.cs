using rest_examenfinal_videojuegos.Datos.entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace rest_examenfinal_videojuegos.Datos.bd
{
    public interface IproductosService
    {
        Task<List<productos>> listar();
        Task agregar(productos producto);
        Task<List<detalleVenta>> ventaTotal(int productoId);
    }

    public class productosService : IproductosService
    {
        private static string cadenaConexion = "Server=tcp:distribucionp.database.windows.net,1433;Initial Catalog=antaradb;Persist Security Info=False;User ID=DistribucionAC;Password=antaraproyect1.;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;";

        private readonly IdapperHelper dapper;
        public productosService(IdapperHelper dapper)
        {
            this.dapper = dapper;
        }

        public async Task agregar(productos producto)
        {
             await dapper.Insert<productos>(cadenaConexion, "vijap.crear_producto", new {
                 @nombre = producto.nombre,
                 @gama = producto.gama,
                 @dimensiones = producto.dimensiones,
                 @proveedor = producto.proveedor,
                 @cantidadEnStock = producto.cantidadEnStock,
                 @precioVenta = producto.precioVenta,
                 @precioProveedor = producto.precioProveedor
             });
        }

        public async Task<List<productos>> listar()
        {
            return await dapper.Consultas<productos>(cadenaConexion, "vijap.lista_productos", null);
        }

        public async Task<List<detalleVenta>> ventaTotal(int productoId)
        {
            return await dapper.Consultas<detalleVenta>(cadenaConexion, "vijap.detalleVentas_producto", new
            {
                @idProducto = productoId
            });
        }
    }
}
