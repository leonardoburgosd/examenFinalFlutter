using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace rest_examenfinal_videojuegos.Datos.entidades
{
    public class productos
    {
        public int codigoProducto { get; set; }
        public string nombre { get; set; }
        public int gama { get; set; }
        public string dimensiones { get; set; }
        public string proveedor { get; set; }
        public double cantidadEnStock { get; set; }
        public double precioVenta { get; set; }
        public double precioProveedor { get; set; }
    }
}
